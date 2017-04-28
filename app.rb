require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "My session secret"
  end

  get "/" do
    erb(:index)
  end

  post "/names" do
    $game = Game.new(params[:player_1], params[:player_2])

    redirect '/play'
  end

  get '/play' do
    erb(:play)
  end

  post '/attack' do
    erb(:attack)
  end

  get "/end_game" do
    $game.winner
    erb(:end_game)
  end

end
