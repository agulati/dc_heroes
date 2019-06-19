class Die

  attr_reader :sides

  def initialize(sides:)
    @sides = sides
  end

  def roll
    (1..sides).to_a.sample
  end
end
