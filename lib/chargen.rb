# frozen-string-literals: false

require_relative 'travtools'

# A Traveller Character
class Character
  include TravTools

  attr_reader :name, :attributes, :age, :career, :title, :skills, :inventory,
              :service_history, :gender

  def initialize(args = {})
    args = defaults.merge(args)
    @gender = args[:gender]
    @name = generate_name(args[:name])
    @attributes = args[:attributes]
    @age = args[:age]
    @career = args[:career]
    @title = noble_rank(attributes[:soc], @gender)
    @skills = {}
    @inventory = { money: 0, items: [], ship: '' }
    @service_history = []
  end

  def defaults
    { gender: TravTools.random_gender,
      name: false,
      attributes: TravTools.roll_stats,
      age: rand(12..18),
      career: false }
  end

  def generate_name(name)
    case name
    when false
      TravTools.random_name(gender)
    else
      @name = name
    end
  end

  def to_s
    "
    Gender #{@gender}
    Name #{@title}#{@name}
    Age: #{@age}
    Attributes #{TravTools.to_hex(@attributes)}
    "
  end

  def noble_rank(soc, gender)
    TravTools.soc_title(soc, gender)
  end

  def add_skill(skill)
    if @skills.key?(skill)
      @skills[skill] += 1
    else
      @skills[skill] = 1
    end
  end

  def add_item(item)
    @inventory[:items].push(item)
  end

  def add_money(amount)
    @inventory[:money] += amount
  end

  def add_ship(ship)
    @inventory[:ship] += ship
  end

  def modify_attribute(attribute, amount = 1)
    @attributes[attribute] += amount
  end

  def increase_age(amount)
    @age += amount
    check_age(age)
  end

  def check_age(age)
    case age
    when 34..49
      physical_aging_check(-1, 8, 7)
    when 50..65
      physical_aging_check(-1, 9, 8)
    when 66..Float::INFINITY
      physical_aging_check(-2, 9, 9)
      aging_throw(:int, -1, 9)
    end
  end

  def physical_aging_check(penalty, str_difficulty, dex_difficulty)
    aging_throw(:str, penalty, str_difficulty)
    aging_throw(:end, penalty, str_difficulty)
    aging_throw(:dex, penalty, dex_difficulty)
  end

  def aging_throw(stat, penalty, difficulty)
    modify_attribute(stat, penalty) unless TravTools.check(difficulty)
  end
end

10.times do
  puts Character.new
end
