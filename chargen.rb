# frozen-string-literal: false

require_relative 'dice'
require_relative 'careers'

# Randomly Generates a Traveller Character
class CharGen
  include Dice
  include Careers

  attr_reader :number, :service, :min_terms, :max_terms, :characters

  def initialize(args)
    args = defaults.merge(args)
    @number = args[:number]
    @service = args[:service]
    @min_terms = args[:min_terms]
    @max_terms = args[:max_terms]
    @characters = []
    run_chargen
  end

  def defaults
    { number: 1,
      service: false,
      min_terms: -1,
      max_terms: Float::INFINITY }
  end

  def run_chargen
    generate_characters
    puts characters
  end

  def generate_characters
    number.times do
      characters << Character.new(determine_service)
    end
  end

  def determine_service
    @service ? service : draft
  end

  def draft
    Careers::SERVICES.sample
  end
end

# A Traveller character
class Character
  include Dice
  include Careers

  attr_reader :name, :age, :stats, :service, :rank, :skills, :items, :terms,
              :noble_index

  def initialize(branch)
    @service = branch
    @terms = 0
    @rank = 0
    @name = 'Sam'
    @stats = roll_stats
    @noble_index = stats[:soc] - 10
    @age = rand(12..18)
    @skills = []
    @items = []
    @alive = true
  end

  def to_s
    "
    #{soc_title}#{name}, Age: #{age} (#{to_uwp})
    #{rank_title} #{service[:name]}, #{terms} terms
    Skills: #{skills}
    Inventory: #{items}
    "
  end

  def roll_stats
    Hash[%i[str dex end int edu soc].zip(Dice.multiroll)]
  end

  def to_uwp
    Dice.to_hex(stats.values)
  end

  def soc_title
    "#{Careers::NOBILITY[noble_index].sample} " if noble_index.positive?
  end

  def rank_title
    if rank > service[:ranks].length
      service[:ranks][-1]
    else
      service[:ranks][rank]
    end
  end
end

CharGen.new({ number: 10 })
