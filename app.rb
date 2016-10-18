require 'sinatra' 
require 'sinatra/activerecord'
require './models'

set :database, "sqlite3:uncubed.sqlite3"

$menu = [

  {page: 'main', href: './generalPage'},
  {page: 'home', href: './home'},
  {page: 'personal', href: './profile'}
  ]
  
get '/home' do 
 erb :home
end


#-------------------------
get '/registration' do 
 
 erb :registration
end

post '/registration' do
  #if user is already in the system. also creating a new user
  @regus = User.create_with(locked: false).find_or_create_by(params)
  # @user = @regus.email
  erb :registration
end
#-------------------------


get '/personal/:id' do 
  @users = User.find(params[:id])
  erb :personal
end

post '/home' do
  
  a = params["email"].to_s
  b = User.find_by(email: a)

  @confirmation = b[:fname]
  @lname = b[:lname]
  @username = b[:username]
  @gender = b[:gender]
  @email = b[:email]
  
  # @user = @regus.email
  erb :personal
end



#-------------------------

get '/general' do
  erb :generalPage
end

<<<<<<< HEAD
post '/general' do 
  c = params["username"]
  d = User.find_by(username: c)
  e = d[:id].to_i
  Post.create(id: e, content: params["content"])
  @comment = Post.first.to_s
=======
post '/posts' do 
  
>>>>>>> 5589160029deedeaf69450e2e6fceaf5dd7f97a4
  erb :generalPage
end

#-------------------------
get '/editpersonal' do
  erb :editpersonal
end



post '/editpersonal' do
  #if user is already in the system. also creating a new user
  @edited = User.create_with(locked: false).find_or_create_by(params)

  # @user = @regus.email
  erb :editpersonal
end