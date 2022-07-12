# frozen-string-literal: true

# Generic Dice roller class
class Dice
  attr_reader :quantity, :sides

  def initialize(args)
    args = defaults.merge(args)
    @quantity = args[:quantity]
    @sides = args[:sides]
  end

  def defaults
    { quantity: 2, sides: 6 }
  end

  def roll
    Array.new(quantity) { rand(1..sides) }
  end

  def sum
    roll.reduce(0) { |sum, die| sum + die }
  end

  def check(target)
    sum >= target
  end

  def throw(target)
    sum <= target
  end
end
