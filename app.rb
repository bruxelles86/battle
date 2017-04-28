require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base

  before do
    @game = Game.instance
  end

  get "/" do
    erb(:index)
  end

  post "/names" do
    @game = Game.create(params[:player_1], params[:player_2])
    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    erb(:attack)
  end

  get "/end_game" do
    erb(:end_game)
  end

end
