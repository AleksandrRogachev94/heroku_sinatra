require './config/environment'

class ApplicationController < Sinatra::Base
  set :views, 'app/views'

  get '/' do
    @posts = Post.all
    erb :index
  end
end
