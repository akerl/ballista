require 'ballista/frequencies/base'
require 'ballista/frequencies/monthly'
require 'ballista/frequencies/weekly'
require 'ballista/frequencies/biweekly'


module Ballista
  module Frequencies
    class << self
      FREQUENCIES = {
        monthly: Monthly,
        weekly: Weekly,
        biweekly: Biweekly
      }.freeze
    end
  end
end
