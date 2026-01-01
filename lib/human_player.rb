# frozen_string_literal: true

# Player class
class HumanPlayer
  attr_accessor :guesses

  def initialize(board)
    @board = board
    @guesses = 0
    @past_guesses = []
  end

  def guess
    puts "Chance: #{@guess_no}"
    puts 'Guess the code: '
    @curr_guess = gets.chomp
    @past_guesses.append(@curr_guess)
    @guesses += 1
    @curr_guess
  end

  def pass_feedback(feedback)
    # Nothing for this iteration
  end
end
