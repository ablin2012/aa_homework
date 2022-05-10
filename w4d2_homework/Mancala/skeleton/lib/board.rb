class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14)
    self.place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups[6] = Array.new
    @cups[13] = Array.new
    (0..5).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
    (7..12).each do |i|
      @cups[i] = [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,13)
    raise "Starting cup is empty" if @cups[start_pos].length == 0
  end

  def make_move(start_pos, current_player_name)
    i = @cups[start_pos].length
    j = 1
    end_index = start_pos
    while i > 0
      if (current_player_name == @name1 && (start_pos+j)%14 == 13) || (current_player_name == @name2 && (start_pos+j)%14 == 6)
        j += 1
        end_index = (end_index + 1) % 14
      else
        @cups[(start_pos+j)%14] << @cups[start_pos].shift
        i -= 1
        j += 1
        end_index = (end_index + 1) % 14
      end
    end
    self.render
    return next_turn(end_index)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 13 ||  ending_cup_idx == 6
    return :switch if @cups[ending_cup_idx].length == 1 
    return ending_cup_idx if @cups[ending_cup_idx].length > 1
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    empty1 = true
    empty2 = true
    (0..5).each do |i|
      empty1 = false if @cups[i].length > 0
    end
    (7..12).each do |i|
      empty2 = false if @cups[i].length > 0
    end
    return empty1 || empty2
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @name1 if  @cups[6].length > @cups[13].length
    return @name2 if   @cups[6].length < @cups[13].length
  end
end
