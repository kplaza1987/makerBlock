require 'sinatra' 
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:uncubed.sqlite3"

$menu = [
  {page: 'main', href: '/generalPage'},
  {page: 'home', href: '/home'}
  ]
  
 get '/' do 
  @body_class ='home'
  erb :home
end

# ------------------------


get '/personal/:id' do 
  @users = User.find(params[:id])
  erb :personal
end

# get '/company/:id' do 
#   @company = Company.find(params[:id])
#   erb :company_profile
# end


get '/' do 
@regus = User.find_by(email: @user)
 erb :home
end

post '/' do
  
	# a = params["bob"].to_s
  @regus = User.create(params)
  @user = @regus.email
  erb :home
end
#-------------------------




# ------------------------


get '/personal' do 

 erb :personal
end

post '/personal' do
 erb :personal 
end
#-------------------------

get '/posts' do
  @posts = Post.all
  erb :generalPage
end

post '/posts' do 
  erb :generalPage
end

