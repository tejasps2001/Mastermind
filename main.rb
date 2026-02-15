# frozen_string_literal: true

# Implementation of the Mastermind game

require_relative 'lib/board'
require_relative 'lib/human_maker'
require_relative 'lib/human_breaker'
require_relative 'lib/computer_maker'
require_relative 'lib/computer_breaker'

title =   '------------------M-A-S-T-E-R-M-I-N-D------------------'
slogan =  '------------The classic code cracking game!------------'

# Game configuration
total_guesses = 12 # Maximum guesses the codebreaker can make

# Decide on who is going to be the codemaker and the codebreaker
board = Board.new(total_guesses)
while true
  puts 'Press 1 to become the codemaker or 2 to become the codebreaker'
  chosen = gets.chomp.to_i
  case chosen
  when 1
    maker = HumanMaker.new(board)
    breaker = ComputerBreaker.new(board)
    break
  when 2
    maker = ComputerMaker.new(board)
    breaker = HumanBreaker.new(board)
    break
  else
    puts 'Wrong option. Try again!'
  end
end

# The computer shall generate a secret code
puts title
puts slogan
maker.generate_code

def user_won(board)
  board.print_board
  puts 'You won!'
  exit 0
end

while breaker.guesses <= total_guesses
  board.print_board
  # No need to exchange guess and feedback between the players
  # since they can be obtained from the board
  breaker.make_guess
  maker.pass_feedback
  user_won(board) if breaker.win?
  # Codebreaker didn't win; loop again
end

puts "Sorry! You couldn't figure it out in time!"
puts "The code was #{board.secret_code}."
