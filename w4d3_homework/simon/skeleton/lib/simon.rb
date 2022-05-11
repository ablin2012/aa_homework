class Simon

  COLORS = %w(red blue green yellow)
  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    while !game_over
      take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !game_over
      self.sequence_length += 1
      round_success_message
    elsif game_over
      game_over_message
    end
  end

  def show_sequence
    self.add_random_color
    seq.each do |color|
      puts color
      sleep(1)
      system "clear"
    end
  end

  def require_sequence
    print "enter sequence (color color color):"
    guess = gets.chomp.split(" ")
    game_over = true if guess != seq
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    puts "correct! keep going!"
  end

  def game_over_message
    puts "game over, you lose"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
