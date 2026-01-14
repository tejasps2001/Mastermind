# frozen_string_literal: true

# Class to represent an instance of the board
class Board
  attr_accessor :secret_code, :key_holes, :curr_guess
  attr_reader :code_holes

  def initialize(total_guesses)
    @code_holes = Array.new(12) { Array.new(4, '-') }
    @key_holes = Array.new(12) { Array.new(4, ' ') }
    @total_guesses = total_guesses
    # curr_guess will be updated when the breaker passes a guess
    @curr_guess = 0
    @secret_code = Array.new(4, 0)
  end

  def print_board
    puts '----------------------------------------------------------\n'
    12.times do |i|
      print '|'
      print str.join(@key_holes[i], ' ')
      print str.join(@code_holes[i], ' ')
      print '|\n\n'
    end
    puts '----------------------------------------------------------'
  end
end
