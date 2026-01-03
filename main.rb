# frozen_string_literal: true

# Implementation of the Mastermind game
# Algorithm of Donald Knuth

require_relative 'lib/player'

title =   '------------------M-A-S-T-E-R-M-I-N-D------------------'
slogan =  '------------The classic code cracking game!------------'

# Game configuration
total_guesses = 12 # Maximum guesses the codebreaker can make

# Computer is the codemaker and the human is the codebreaker
board = Board.new(total_guesses)
maker = ComputerPlayer.new(board)
breaker = HumanPlayer.new(board)

# The computer shall generate a secret code
puts title
puts slogan
maker.generate_code
puts 'I have a secret code ready! Now, try to guess it, kiddo!'

while breaker.guesses <= total_guesses
  board.print_board
  # No need to exchange guess and feedback between the players
  # since they can be obtained from the board
  breaker.make_guess
  breaker.pass_feedback
  user_won if breaker.win?
  # Codebreaker didn't win; loop again
end

puts "Sorry! You couldn't figure it out in time!"

def user_won
  puts 'You won!'
  exit 0
end
