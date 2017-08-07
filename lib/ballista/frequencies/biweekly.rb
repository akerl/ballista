module Ballista
  module Frequencies
    ##
    # Biweekly actions
    class Biweekly < Weekly
      def step
        14
      end
    end
  end
end
