# frozen-string-literal: false

require_relative 'trav_tools'

# A Traveller Character
class Character
  include TravTools

  attr_reader :name, :attributes, :age, :skills, :inventory, :service_history,
              :gender, :deceased, :commissioned, :retired

  def initialize(name = nil, gender = rand_gender)
    @gender = gender
    @name = generate_name(name)
    @attributes = generate_stats
    @age = rand(12..18)
    @skills = {}
    @inventory = { money: 0, items: [], ship: '' }
    @service_history = []
    @deceased = false
    @commissioned = false
    @retired = false
  end

  def generate_name(name)
    name.nil? ? TravTools.random_name(gender) : name
  end

  def generate_stats
    TravTools.roll_stats
  end

  def rand_gender
    TravTools.random_gender
  end

  def noble_rank
    TravTools.soc_title(attributes[:soc], @gender)
  end

  def to_s
    "
    Name #{noble_rank}#{name}
    Age: #{age}
    Attributes #{TravTools.to_hex(attributes)}
    Skills: #{print_skills}
    Cr#{inventory[:money]}
    Items: #{inventory[:items].join(',')}
    Ship: #{inventory[:ship]}
    Service History:
    #{service_history.join("\n")}
    "
  end

  def add_skill(skill)
    @skills.key?(skill) ? @skills[skill] += 1 : @skills[skill] = 1
  end

  def print_skills
    skills.map { |k, v| "#{k}-#{v}" }.sort.join(', ')
  end

  def add_item(*items)
    items.each { |item| @inventory[:items].push(item) }
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
    aging_crisis?(stat)
  end

  def aging_crisis?(stat)
    return if attributes[stat].positive? || deceased

    if TravTools.throw(8)
      @attributes[stat] = 1
      @service_history.push "Recovered from a serious illness (#{stat.to_s.upcase} healed from 0)"
    else
      @attributes[stat] = 0
      @deceased = true
      @service_history.push('Died of Old Age.')
    end
  end
end

def multi_test
  10.times do
    puts Character.new
  end
end

def age_test
  char = Character.new
  puts char
  char.add_item('Sword')
  char.add_money(1000)
  char.add_ship('Type-S Scout')
  char.add_skill('Sword')
  until char.deceased
    char.increase_age(4)
    puts char
  end
end

def skill_test(*args)
  char = Character.new
  args.each do |arg|
    break if char.deceased

    char.add_skill(arg)
    char.increase_age(8)
    puts char
  end
end

multi_test

age_test

skill_test('Blade Combat', 'Gun Combat', 'Pilot', 'Pilot', 'Medic', 'Gambling')
