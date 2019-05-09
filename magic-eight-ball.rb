require "colorize"
require "pry"

class Answers
  def initialize
    @answers = [
      "of course",
      "well, i would hope not",
      "yes, no, maybe so",
      "yes",
      "no. just no.",
      "try asking again",
      "no",
      "maybe",
    ]
  end #end def
end # end class

class MagicEightBall < Answers
  def initialize
    @answers_clone = []     #initialize a clone array
    super() # get answers from answers class
    main_menu
  end #end def

  def main_menu
    puts "~".colorize(:magenta) * 50
    puts "Welcome to the Magic Eight Ball!".colorize(:magenta)
    puts
    puts "Type 'ask' to ask a question".colorize(:yellow)
    puts "Type 'quit' to exit".colorize(:yellow)
    puts "~".colorize(:magenta) * 50
    puts
    print "Enter choice > ".colorize(:magenta)
    choice = gets.strip.to_s.downcase
    case choice
    when "ask"
      ask_question
    when "reset_answers"
      reset_answers
    when "add_answers"
      #will clone the array to retain original options
      @answers_clone = @answers.clone
      add_answers
    when "print_answers"
      print_answers
    when "quit"
      puts
      puts "Thanks for playing!"
      exit
    else
      puts "Invalid Option".colorize(:red)
      main_menu
    end # end case
  end # end main_menu

  def ask_question
    puts
    puts "Type a question to get an answer, or type 'quit' to exit: "
    print "Type a question > ".colorize(:magenta)
    @question = gets.strip.to_s.downcase
    if @question == "quit"
      puts
      puts "Thanks for playing!"
      puts "Goodbye!"
      exit
    else
      sleep(1)
      # @answers.sample do |n|
      puts
      puts "~".colorize(:cyan) * 45
      puts "The Magic 8 Ball Says: '#{@answers.sample}'".colorize(:cyan)
      puts "~".colorize(:cyan) * 45
      main_menu
      # end # end do
    end # end if
  end #ask_question

  def reset_answers
    puts
    puts "Restoring original bank...".colorize(:magenta)
    puts
    sleep(1)
    puts "Alright! All set!".colorize(:yellow)
    #reset answers back to the original cloned array
    @answers = @answers_clone
    main_menu
  end # end reset_answers

  def add_answers
    puts
    puts "Please type your answer to add to my bank or type 'exit' to return to main menu.".colorize(:cyan)
    print "Enter answer > ".colorize(:magenta)
    @add_choice = gets.strip.to_s.downcase
    if @add_choice == "exit"
      main_menu
    elsif (@answers.include?(@add_choice))
      puts "Oops! Looks like I already that in my bank. Please enter a new one!".colorize(:red)
      add_answers
    else
      @answers << @add_choice # puts input into answer array
      main_menu
    end #if
  end # end add_answers

  def print_answers
    puts
    puts "Here is a list of your answers:".colorize(:magenta)
    puts
    # loop through answers array and print list
    @answers.each_with_index do |a, i|
      puts "#{i + 1}) #{a}"
    end
    puts
    main_menu
  end # end print_answers
end # end Magic Eight Ball

binding.pry
