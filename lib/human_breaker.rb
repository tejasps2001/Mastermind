# frozen_string_literal: true

# Human Codebreaker class
class HumanPlayer
  def initialize(board)
    @board = board
  end

  def make_guess
    guesses = @board.code_holes # ref
    puts "Chance: #{@board.curr_guess_no + 1}"
    @board.curr_guess_no += 1
    puts 'Guess the code: '
    curr_guess = gets.chomp.split('')
    guesses[@board.curr_guess_no] = curr_guess
  end

  def win?
    true if @board.key_holes[@board.curr_guess_no].all? do |feedback|
      feedback == 'C'
    end
  end

  def guesses
    @board.curr_guess_no
  end
end
