# frozen_string_literal: true

# Computer Player class
class ComputerMaker
  def initialize(board)
    @board = board
  end

  def generate_code
    options = ('1'..'6').to_a
    @board.secret_code = options.sample(4)
    puts 'I have a secret code ready! Now, try to guess it, kiddo!'
  end

  def pass_feedback
    curr_feedback = @board.key_holes[@board.curr_guess_no] # ref
    curr_guess_clone = @board.code_holes[@board.curr_guess_no].clone # new copy
    secret_code = @board.secret_code.clone # new copy
    feedback_index = 0

    # Feedback with colored pegs
    feedback_index = color_pegs(curr_feedback, curr_guess_clone, secret_code, feedback_index)

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
      next unless guess[guess_index].eql?(secret_code[guess_index])

      # puts "#{guess[guess_index]} is same as #{secret_code[guess_index]}"
      # puts 'So, giving a Colored peg.'
      feedback[feedback_index] = 'C'
      feedback_index += 1
      guess[guess_index] = '-'
      secret_code[guess_index] = '-'
      # puts "Feedback index is #{feedback_index}"
    end
    feedback_index
  end

  def white_pegs(feedback, guess, secret_code, feedback_index)
    guess.each do |guess|
      pos = secret_code.find_index(guess)
      next unless pos

      # puts "#{guess} is present at #{pos} position in #{secret_code}"
      # puts 'So, giving a white peg'
      feedback[feedback_index] = 'W'
      feedback_index += 1
      secret_code[pos] = '-'
      # puts "Feedback index is #{feedback_index}"
    end
  end
end
