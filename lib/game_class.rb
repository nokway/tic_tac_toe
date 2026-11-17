require_relative 'player_class'
require_relative 'board_class'
require('byebug')

class GameClass
  attr_reader :players, :current_player_id, :board_manager

  def initialize(board_manager)
    @players = [PlayerClass.new('X'), PlayerClass.new('O')]
    @board_manager = board_manager
    @current_player_id = 0
  end

  def current_player
    players[current_player_id]
  end

  def switch_players
    @current_player_id = other_player_id
  end

  def other_player_id
    1 - @current_player_id
  end

  def ask_player
    board_manager.display
    puts 'Where do you wanna put ur thing'
    position = gets.to_i
    return position if board_manager.occupied?(position) == false

    puts 'Please try again'
  end

  def return_won_or_draw
    if board_manager.won?(current_player.marker)
      "Player #{current_player.marker} Won!"
    elsif board_manager.full?
      'Draw!'
    end
  end

  def play
    until board_manager.won?(current_player.marker) || board_manager.full?
      position = ask_player
      board_manager.place(current_player.marker, position)
      switch_players
    end

    puts return_won_or_draw
  end
end

# Until any player has won
# display, get input place and switch players
# Todo: Make a method for finding win condition so we can output depending on wether it was draw or win
