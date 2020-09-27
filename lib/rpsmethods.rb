class RockPaperScissors
  #sets initial game variables for score, and the array of options
  attr_reader :selections
  def initialize
    selections = ["rock", "paper", "scissors"]
    @selections = selections 

    u_score = 0
    c_score = 0
    @u_score = u_score
    @c_score = c_score
  end

  #Lets the player make their selection, checks valid selection to see if their input is valid, if it is then calls computer_selection to make a choice for the computer, and then won to determin the outcome of the game. If your selection is not valid it starts play over again prompting you to make a valid selection.
  def play
    puts "Choose 'Rock', 'Paper', or 'Scissors'"
    input = gets.strip
    input_downcase(input)
    if valid_selection?
      computer_selection
      won
    else
      play
    end
  end

  #Takes in user input and downcases it, along with converting it to an instance variable
  def input_downcase(input)
    @input = input.downcase.to_s
  end

  #Checks if the selection is valid (if it is included in the array of possible selections)
  def valid_selection?
    @selections.include?(@input)
  end

  #Makes a selection for the computer and saves it into an instance variable
  def computer_selection
    c_choice = rand(0..2)
    @comp = @selections[c_choice]
  end

  #Compares the user's input to the computer's choice to determine an outcome, adds points based on that outcome, and calls play again
  def won
    if @input == @comp
      puts "You picked #{@input}. Computer picked #{@comp}. It's a tie!"
      puts "Current Score: [User] #{@u_score} *** [Computer] #{@c_score}" 
      play_again
    elsif @input == "rock" && @comp == "scissors" || @input == "paper" && @comp == "rock" || @input == "scissors" && @comp == "paper"
      @u_score += 1
      puts "You picked #{@input}. Computer picked #{@comp}. You WIN!!!"
      puts "Current Score: [User] #{@u_score} *** [Computer] #{@c_score}"
      play_again
    elsif 
      @c_score += 1
      @input == "rock" && @comp == "paper" || @input == "paper" && @comp == "scissors" || @input == "scissors" && @comp == "rock"
      puts "You picked #{@input}. Computer picked #{@comp}. You LOSE!!!"
      puts "Current Score: [User] #{@u_score} /// [Computer] #{@c_score}"
      play_again
    else
      puts "You dun fucked up, I'm not even telling you the score because I don't even know how you got here bro"
      play_again
    end
  end

  #gives you the option to play again, or end your game
  def play_again
    puts "Do you want to play again? (y/n)"
    @pinput = gets.strip.downcase
    if @pinput == "no" || @pinput == "n"
      puts "Thanks for Playing!"
    elsif @pinput == "yes" || @pinput == "y"
      play
    else
      play_again
    end
  end
  
end



