class TurnService

  ACTION = "action".freeze
  RESULT = "result".freeze

  def self.take_turn(actor:, opposer:, action_type:)
    new(
      actor: actor,
      opposer: opposer,
      action_type: action_type
    ).take_turn
  end

  attr_reader :actor, :opposer, :action_type

  def initialize(actor:, opposer:, action_type:)
    @actor        = actor
    @opposer      = opposer
    @action_type  = action_type
  end

  def take_turn
    return DiceRollService::FAILED_ROLL unless successful_roll
    actual_result
  end

  private

  def actual_result_node
    @actual_result_node ||= result_table.get_node_for_index(x: result_node.x_index, result_node.y_index - column_shifts)
  end

  def actual_result
    actual_result_node.value
  end

  def result_node
    @result_node ||= result_table.get_node_for_values(x: resistance_value, y: effect_value)
  end

  def action_node
    @action_node ||= action_table.get_node_for_values(x: opposing_value, y: acting_value)
  end

  def successful_roll
    action_roll >= success_value
  end

  def success_value
    action_node.value
  end

  def action_roll
    @action_roll ||= DiceRollService.do(doubles_threshold: success_value)
  end

  def acting_value
    @acting_attribute ||= actor.attribute_val(
      action_type: action_type,
      action: :acting_opposing
    )
  end

  def opposing_value
    @opposing_attrbiute ||= opposer.attribute_val(
      action_type: action_type,
      action: :acting_opposing
    )
  end

  def effect_value
    @effect_value ||= actor.attribute_val(
      action_type: action_type,
      action: :effect
    )
  end

  def resistance_value
    @resistance_value ||= opposer.attribute_val(
      action_type: action_type,
      action: :resistance
    )
  end

  def column_shifts
    x_index = action_node.x_index
    y_index = action_node.y_index
    shifts  = 0
    val     = success_value

    while val < action_roll do
      x_index += 1
      next_node = action_table.get_node_for_index(x: x_index, y: y_index)
      if next_node.nil?
        diff = action_roll - val
        shifts += diff / 5
        break
      elsif action_roll >= next_node.value
        shifts += 1
        val = next_node.value
      end
    end

    shifts
  end

  def action_table
    @action_table ||= Table.find_by(type: ACTION)
  end

  def result_table
    @result_table ||= Table.find_by(type: RESULT)
  end
end
