require_relative './player'

class Game

attr_accessor :player1, :player2
attr_reader :this_turn

  def initialize(player1, player2)
      @player1 = Player.new(player1)
      @player2 = Player.new(player2)
      @this_turn = @player1
  end

  def attack(player = @this_turn)
    player.receive_damage
    @this_turn == @player1 ? @this_turn = @player2 : @this_turn = @player1
  end

  def winner
    @player1.hp > 0 ? @winner = @player1.name : @winner = @player2.name
  end


end
