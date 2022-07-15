# frozen-string-literal: true

# Dice roller for 2d6 games
module Dice
  def self.roll(quantity = 2, sides = 6)
    Array.new(quantity) { rand(1..sides) }
  end

  def self.sum
    roll.reduce(0) { |sum, die| sum + die }
  end

  def self.check(target, mod = 0)
    sum + mod >= target
  end

  def self.throw(target, mod = 0)
    sum + mod <= target
  end

  def self.multiroll(quantity = 6)
    Array.new(quantity) { sum }
  end

  def self.to_hex(stat_array)
    stat_array.map { |num| num.to_s(16).upcase }.join('')
  end
end
