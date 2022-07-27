# frozen-string-literal: true

# Utilities for the Traveller RPG
module TravTools
  NOBILITY = [['', ''], %w[Sir Dame], %w[Baron Baroness], %w[Marquis Marchioness],
              %w[Count Countess], %w[Duke Duchess]].freeze
  NAMES_F = %w[Diana Sophie Sophia Clarissa].freeze
  NAMES_M = %w[Jack Stephen Henage Joseph].freeze
  NAMES_L = %w[Aubrey Williams Villiers Maturin Dundas Kikenoe Clonfert Blaine].freeze

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

  def self.roll_stats
    Hash[%i[str dex end int edu soc].zip(multiroll)]
  end

  def self.to_hex(stat_hash)
    stat_hash.values.map { |num| num.to_s(16).upcase }.join('')
  end

  def self.soc_title(soc, gender)
    noble_index = soc - 10
    "#{NOBILITY[noble_index][gender == 'female' ? 1 : 0]} " if noble_index.positive?
  end

  def self.random_gender
    %w[male female].sample
  end

  def self.random_name(gender)
    case gender
    when 'female'
      "#{NAMES_F.sample} #{NAMES_L.sample}"
    when 'male'
      "#{NAMES_M.sample} #{NAMES_L.sample}"
    end
  end
end
