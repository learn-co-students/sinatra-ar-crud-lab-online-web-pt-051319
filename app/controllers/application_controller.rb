
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    Articles.create
    erb :new
  end

  get '/articles' do 
    Articles.all
    erb :index
  end

  get '/articles/:id' do
    Articles.find(params[:id])
    erb :show
  end

  get '/articles/:id/edit' do

    erb :edit
  end


end
