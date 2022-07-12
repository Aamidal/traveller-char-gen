# frozen-string-literal: true

# Dice roller for 2d6 games
module Dice
  def self.roll(quantity = 2, sides = 6)
    Array.new(quantity) { rand(1..sides) }
  end

  def self.sum
    roll.reduce(0) { |sum, die| sum + die }
  end

  def self.check(target)
    sum >= target
  end

  def self.throw(target)
    sum <= target
  end
end
