# frozen_string_literal: true

# Class to represent an instance of the board
class Board
  def initialize(total_guesses)
    @code_holes = Array.new(12) {Array.new(4, '-')}
    @key_holes = Array.new(12) { Array.new(4, ' ') }
    @total_guesses = total_guesses
  end

  def print_board
    puts '----------------------------------------------------------\n'
    12.times do |i|
      print '|'
      print key_hole[i]
      str.join(code_hole, ' ')
      print '|\n\n'
    end
    puts '----------------------------------------------------------'
  end
end
