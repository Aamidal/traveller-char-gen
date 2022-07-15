# frozen-string-literal: true
require_relative 'dice'

class CharGenerator
  include Dice

  attr_reader :stats, :age, :career, :term_constraints, :verbose

  def initialize(args)
    args = defaults.merge(args)
    
    @term_constraints = [args[:min_terms], args[:max_terms]]
    @verbose: args[:verbose]
  end

  def defaults
    { min_terms: -1,
      max_terms: Float::INFINITY,
      verbose: false,
    }
  end

  def random_service
    ['Navy', 'Marines', 'Army', 'Scout', 'Merchant', 'Other'].sample
  end

  def min_terms?
    terms >= term_constraints[0]
  end

  def below_max_terms?
    terms <= term_constraints[1]
  end

end

class ServiceBranch
  include Dice

  def initialize(verbose = false)
    @verbose = verbose
  end

  def new_term(stats, rank)
  end

  def enlist?
  end

  def survive?
  end

  def comission?
  end

  def promotion?
  end

  def reenlist?
  end

  def skills?
  end

  def benefits?
  end
end