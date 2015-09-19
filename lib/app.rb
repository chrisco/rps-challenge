require 'sinatra/base'
require 'byebug'


class App < Sinatra::Base
  set :views, proc {File.join(root, '..', 'views')}
  enable :sessions

  get '/' do
    erb :index
  end

  post '/play' do
    if params[:player_name] == ''
      erb :index
    else
      @player_name = params[:player_name]
      # p1 = Player.new(@player_name)
      session[:player_name] = params[:player_name]
      # session[:p1] = p1
      erb :play
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
