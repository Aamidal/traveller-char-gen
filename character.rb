# frozen_string_literal: false

require_relative 'dice'

# A Traveller character
class Character
  include Dice
  attr_reader :name, :age, :career, :stats, :skills, :inventory

  def initialize(args)
    @name = args[:name]
    @age = args[:age]
    @stats = args[:stats]
    @rank = args[:career[:rank]]
    @service = args[:career[:service]]
    @skills =  args[:career[:skills]]
    @inventory = args[:career[:items]]
  end

  def to_s
    puts "#{name}, Age: #{age}
          #{to_uwp(stats)}
          Skills: #{skills}
          Inventory: #{inventory}"
  end

  def to_uwp(stat_array)
    stat_array.map { |num| num.to_s(16).upcase }.join('')
  end
end
