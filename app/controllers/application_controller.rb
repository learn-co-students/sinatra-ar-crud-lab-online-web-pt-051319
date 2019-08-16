
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    erb :show
    # redirect '/articles/#{@article.id}'
  end  
  
  get '/articles' do
    @article = Article.all
    erb :index
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end
  
  get '/articles/:id/edit' do
    # binding.pry
    @article = Article.find_by_id(params[:id])
    erb :edit
  end  

  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :show
  end
  
  delete '/articles/:id' do

  end  
  
  
end
