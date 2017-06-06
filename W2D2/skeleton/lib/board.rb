require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14){[]}
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    @cups.each_with_index do |ele, idx|
      unless idx == 6 || idx == 13
        @cups[idx] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 14)
    raise "Invalid starting cup" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    # debugger

    stones = @cups[start_pos]
    @cups[start_pos] = []

    next_pos = start_pos

    until stones.empty?
      # debugger
      next_pos+=1
      next_pos = 0 if next_pos>13

      if next_pos == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif next_pos == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[next_pos] << stones.pop
      end
    end

    render
    next_turn(next_pos)

  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].count == 1
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
    return true if @cups[0..5].all?{|el| el.empty?}
    return true if @cups[7..12].all?{|el| el.empty?}
    false
  end

  def winner
    case @cups[6].count <=> @cups[13].count
    when 1 then return @name1
    when -1 then return @name2
    when 0 then return :draw
    end
  end
end

board = Board.new("argh", "blargh")
board.make_move(5, "argh")
