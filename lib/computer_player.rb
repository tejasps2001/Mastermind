# frozen_string_literal: true

# Computer Player class
class ComputerPlayer
  def initialize(board)
    @board = board
  end

  def generate_code
    options = [1, 2, 3, 4, 5, 6]
    @board.secret_code = options.sample(4)
  end

  def pass_feedback
    curr_feedback = @board.key_holes[@board.curr_guess] # ref
    curr_guess_clone = @board.code_holes[@board.curr_guess].clone # new copy
    secret_code = @board.secret_code.clone # new copy
    feedback_index = 0

    # Feedback with colored pegs
    color_pegs(curr_feedback, curr_guess_clone, secret_code, feedback_index)

    # Get only those pegs which are in the solution but are incorrectly
    # placed
    curr_guess_clone = curr_guess_clone.select do |guess|
      guess.eql?('-') == false
    end
    # Feedback with white pegs
    white_pegs(curr_feedback, curr_guess_clone, secret_code, feedback_index)
    curr_feedback.shuffle
  end

  def color_pegs(feedback, guess, secret_code, feedback_index)
    guess.each_index do |guess_index|
      if guess[guess_index].eql?(secret_code[guess_index])
        feedback[feedback_index] = 'C'
        feedback_index += 1
        guess[guess_index] = '-'
        secret_code[guess_index] = '-'
      end
    end
  end

  def white_pegs(feedback, guess, secret_code, feedback_index)
    guess.each do |guess|
      pos = secret_code.find_index(guess)
      if pos
        feedback[feedback_index] = 'w'
        feedback_index += 1
        secret_code[pos] = '-'
      end
    end
  end
end
