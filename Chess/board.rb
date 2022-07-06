require_relative  "piece"
require_relative "null_pieces"

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
    end

    def builder
        setup_rows = [0,1,6,7]

        @rows.each.with_index do |array, idx| 
            if setup_rows.include?(idx)
                array.map!.with_index do |ele, idx2| 
                    Piece.new([idx, idx2], "placeholder")
                end
            else
                array.map!.with_index do |ele, idx2| 
                    Null.new([idx, idx2], "blank")
                end
            end
        end
    end

    def render
        @rows.each do |arr|
            puts arr
        end
    end
    
    def [](pos)
        row, col = pos.first, pos.last

        rows[row][col]
    end

    def []=(pos, val)
        row, col = pos.first, pos.last

        rows[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        # row_start, col_start = start_pos.first, start_pos.last
        # row_end, col_end = end_pos.first, end_pos.last

        #eventually we are going to have to check if pos is valid. 
        # we are also going to to have to check if piece is at start. 
        if valid_pos?(start_pos) && valid_pos(end_pos)
            rows[end_pos] = rows[start_pos]
            rows[start_pos] = Null.new(start_pos, "blank")
        end
    end

    def valid_pos?(pos)
        row, col = pos.first, pos.last

        if row.between?(0 .. 7) && col.between?(0 .. 7) 
            true
        else
            false
        end
    end
end

b = Board.new
b.builder
p b
# p b.[]([2,2]) 
p b.move_piece([2,2], [3,3])