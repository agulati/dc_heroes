class DiceRollService

  FAILED_ROLL = -1

  def self.do(dice: [10,10], doubles_threshold: 0)
    new(
      dice: dice,
      doubles_threshold: doubles_threshold
    ).roll
  end

  attr_reader :dice, :doubles_threshold, :rolls, :value

  def initialize(dice:, doubles_threshold:)
    @dice               = dice
    @doubles_threshold  = doubles_threshold
    @value              = 0
  end

  def roll
    @rolls = dice.map { |die| Die.new(sides: die).roll }
    @value = rolls.inject(value) { |sum, val| sum += val }

    snake_eyes? ? FAILED_ROLL : keep_rolling? ? roll : value
  end

  private

  def keep_rolling?
    doubles? && value < doubles_threshold
  end

  def doubles?
    rolls.uniq.length == 1
  end

  def snake_eyes?
    rolls.all? { |v| v == 1 }
  end
end
