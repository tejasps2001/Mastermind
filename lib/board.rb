# frozen_string_literal: true

# Class to represent an instance of the board
class Board
  attr_accessor :secret_code, :key_holes, :curr_guess_no
  attr_reader :code_holes

  def initialize(total_guesses)
    # Guesses made by the codemaker stored in the code_holes array
    @code_holes = Array.new(12) { Array.new(4, '-') }
    # Feedback at each turn stored in the key_holes array
    @key_holes = Array.new(12) { Array.new(4, ' ') }
    @total_guesses = total_guesses
    # curr_guess_no will be updated when the breaker passes a guess
    @curr_guess_no = -1
    @secret_code = Array.new(4, 0)
  end

  def print_board
    puts "-------------------------------------------------------\n"
    12.times do |i|
      print "\t\t||"
      print @key_holes[i].join(' ')
      print '|'
      print @code_holes[i].join(' ')
      print "||\t\t\t\n"
    end
    puts '-------------------------------------------------------'
  end
end
