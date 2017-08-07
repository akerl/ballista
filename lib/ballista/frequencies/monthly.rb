module Ballista
  module Frequencies
    ##
    # Monthly actions
    class Monthly < Base
      def initialize(*_)
        super
        @when = [@when] unless @when.is_a? Array
      end

      def log
        @when.flat_map do |date|
          pointer = Date.new(Date.today.year, 1, date)
          get_dates([], pointer, 0)
        end
      end

      def get_dates(log, pointer, counter)
        date = pointer >> counter
        return log if date > @stop
        return get_dates(log, pointer, counter + 1) if date < @start
        log << entry(date)
        get_dates(log, pointer, counter + 1)
      end
    end
  end
end
