# frozen_string_literal: false

require 'dice'

# A Traveller character
class Character
  include Dice

  attr_reader :name, :age, :service, :stats, :skills, :items

  def initialize(args)
    args = defaults.merge(args)
    @name = args[:name]
    @age = args[:age]
    @stats = args[:stats]
    @service = args[:service]
    @rank = 0
    @skills = []
    @items = []
  end

  def defaults
    { name: '',
      age: rand(12..18),
      stats: generate_characteristics,
      service: random_service }
  end

  def to_s
    puts "#{name}, Age: #{age}
          #{to_uwp(stats)}
          Skills: #{skills}
          Inventory: #{inventory}"
  end

  # def to_uwp(stat_array)
  #   stat_array.map { |num| num.to_s(16).upcase }.join('')
  # end

  def generate_characteristics
    Hash[%i[str dex end int edu soc].zip(Dice.roll_stats)]
  end

  def update_age
    age + 4
  end

  def check_aging
    aging_table = update_aging_table
    aging_throw(:str, aging_table[0], aging_table[1])
    aging_throw(:end, aging_table[0], aging_table[1])
    aging_throw(:dex, aging_table[0] - 1, aging_table[1])
    aging_throw(:int, aging_table[0], aging_table[1] - 1)
  end

  def aging_throw(stat, roll, penalty)
    stats[stat] -= penalty unless Dice.check(roll)
  end

  def update_aging_table
    case age
    when (34..49)
      [8, 1]
    when (50..65)
      [9, 1]
    when (66..)
      [9, 2]
    end
  end
end
