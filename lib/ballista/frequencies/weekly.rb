module Ballista
  module Frequencies
    ##
    # Weekly actions
    class Weekly < Base
      def log
        pointer = Date.parse(@when)
        get_dates([], pointer)
      end

      def get_dates(log, pointer)
        return log if pointer > @stop
        return get_dates(log, pointer + step) if pointer < @start
        log << entry(pointer)
        get_dates(log, pointer + step)
      end

      def step
        7
      end
    end
  end
end
