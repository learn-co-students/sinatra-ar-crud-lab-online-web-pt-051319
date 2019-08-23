
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base
 
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
     redirect to "/articles"
  end
#redirect to index 

#index
   get '/articles' do
    @articles = Article.all
    erb :index
  end
  
#model.new
  get '/articles/new' do
    @article = Article.new
    erb :new
  end
  
#model.create
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

#model.read
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end
  
 

#model.update 
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end
  
 patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end
  
#model.destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end


end