require 'colorize'
FULL_LIFE = 3

@question = nil
@correct_answer = nil
@player_answer = nil
@player1_life = FULL_LIFE
@player1_score = 0
@player2_life = FULL_LIFE
@player2_score = 0
@player1_turn = true

def is_player1_dead?
  @player1_life == 0
end

def is_player2_dead?
  @player2_life == 0
end

def create_question
  first_number = rand(1..20)
  second_number = rand(1..20)
  @question = "What does #{first_number} + #{second_number} equal?"
  @correct_answer = first_number + second_number
end

def show_question
  puts ((@player1_turn) ? "Player 1: " : "Player 2: ") + @question
end

def player_answer_correct?
  @player_answer == @correct_answer
end

def update_score
  (@player1_turn) ? @player1_score += 1 : @player2_score += 1 
end

def update_life
  (@player1_turn) ? @player1_life -= 1 : @player2_life -= 1 
end

def show_scores
  puts "Player 1 Score: #{@player1_score}"
  puts "Player 2 Score: #{@player2_score}"
end

def show_lives
  puts "Player 1 Life Remaining: #{@player1_life}"
  puts "Player 2 Life Remaining: #{@player2_life}"
end

def show_player_error
  puts (((@player1_turn) ? "Player 1" : "Player 2") + " was wrong! The correct answer was #{@correct_answer}").red.bold
end

def show_winner
  puts (((@player1_life > @player2_life) ? "Player 1" : "Player 2") + " is the winner!").green.bold
end

def game
  until is_player1_dead? || is_player2_dead?
    create_question
    show_question
    @player_answer = gets.chomp.to_i
    if player_answer_correct?
      update_score
    else
      update_life
      puts ""
      show_player_error
      show_lives
    end
    @player1_turn = (@player1_turn) ? false : true
    puts ""
  end
  show_winner
  show_scores
end

game