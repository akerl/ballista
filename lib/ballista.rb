##
# Define the main module
module Ballista
  class << self
    ##
    # Insert a helper .new() method for creating a new Projection object

    def new(*args)
      self::Projection.new(*args)
    end
  end
end

require 'ballista/version'
require 'ballista/projection'
