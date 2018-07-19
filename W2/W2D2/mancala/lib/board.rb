class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    cups.each_index do |idx|
      cups[idx] += [:stone] * 4 unless [6, 13].include?(idx)
    end
  end

  def valid_move?(start_pos)
    start_pos -= 1 if start_pos.between?(1, 6)
    raise "Invalid starting cup" unless start_pos.between?(0, 12)
    raise "Starting cup is empty" if cups[start_pos].empty?
    raise "Cannot move from a store" if [6, 13].include?(start_pos)
    true
  end

  def opponent_store(current_player_name)
    opponent = current_player_name == name1 ? name1 : name2
    opponent == name1 ? 6 : 13
  end

  def make_move(start_pos, current_player_name)
    handful, cups[start_pos] = cups[start_pos].dup, []
    idx = start_pos + 1
    until handful.empty?
      unless idx == opponent_store(current_player_name)
        ending_cup_idx = idx if handful.length == 1
        cups[idx] << handful.pop
      end
      idx = (idx + 1) % 13
    end
    render
    return next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if cups[ending_cup_idx].empty?
      return :switch
    elsif [6, 13].include?(ending_cup_idx)
      return :prompt
    end
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    top_side = cups[7..12]
    bottom_side = cups.take(6)
    top_side.all?(&:empty?) || bottom_side.all?(&:empty?)
  end

  def winner
    case cups[6].count <=> cups[13].count
    when 1
      return name1
    when -1
      return name2
    when 0
      return :draw
    end
  end
end
