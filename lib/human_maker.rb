# frozen_string_literal: true

# Human Codemaker class
class HumanMaker
  def initialize(board)
    @board = board
  end

  def generate_code
    code = 0
    loop do
      puts 'Make a secret code for the computer to guess: '
      code = gets.chomp.to_i
      break if (1111..6666).code(code)

      puts 'No! The code should be between 1111 and 6666. Try again.'
    end
    @board.secret_code = code
  end

  def valid_feedback?(feedback)
    feedback.all? { |fb| %w[W C].include?(fb) }
  end

  def obtain_feedback
    puts 'Your feedback: '
    feedback = gets.chomp.split('')
    until valid_feedback?(feedback)
      puts "You can only include 'W' or 'C' in your feedback
      (no spaces in between)."
      puts 'Your feedback: '
      feedback = gets.chomp.split('')
    end
    feedback
  end

  def print_feedback_instructions
    puts "Give feedback to the computer's guess."
    puts "Rule 1: 'W' for a peg which is incorrectly placed."
    puts "Rule 2: 'C' for a peg which is correctly placed."
    puts 'Rule 3: No feedback for a peg which is not present in your
    code at all'
  end

  def pass_feedback
    print_feedback_instructions
    feedback = obtain_feedback
    @board.key_holes[@board.curr_guess_no] = feedback
  end
end
