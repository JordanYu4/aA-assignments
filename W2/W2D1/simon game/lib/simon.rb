class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    puts "New game!"
    sleep(2)
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    unless game_over
      show_sequence
      player_guess = require_sequence
      round_success_message(player_guess)
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    seq.each do |color|
      puts color
      sleep(1)
      system("clear")
    end
  end

  def require_sequence
    puts "Sequence commencing:"
    sleep(1)
    show_sequence
    puts "Please reproduce the sequence (e.g. red, blue, green, yellow)"
    guess = STDIN.gets.chomp.delete(',').split
    guess == seq
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message(player_guess)
    if player_guess
      puts "Correct sequence. Good job!"
      sleep(1)
    else
      self.game_over = true
    end
  end

  def game_over_message
    puts "Sorry, you missed that one. Game over!"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
