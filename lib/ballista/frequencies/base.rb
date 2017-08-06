require 'date'

module Ballista
  module Frequencies
    class Base
      def initialize(action, start, stop)
        @name = action[:name]
        @start = action[:starts] ? Date.parse(action[:starts]) : start
        @stop = action[:stops] ? Date.parse(action[:stops]) : stop
        @amount = action[:amount].to_i
        @when = action[:when]
      end

      def entry(date)
        [date, @name, @amount]
      end
    end
  end
end
