require_relative "piece"

class Null < Piece

    def initialize(pos, name = nil)
        super
        @name = nil
    end
end