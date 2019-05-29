class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new

  end

  def show
    @game = Game.find(params[:id])
    @users = User.where(game_id: @game.id)
  end

  def create

  end

  def update

  end
end
