module Ballista
  ##
  # Projection class for creating journals
  class Projection
    def initialize(params = {})
      @entries = params[:entries]
      @months = params[:months]
    end
  end
end
