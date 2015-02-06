enable :sessions

post '/login' do
  @user = User.authenticate(params[:username], params[:password])
  session['user_id'] = @user.id unless @user.nil?
  redirect to '/'
end

get '/logout' do
  session.clear
  redirect to '/'
end

post '/signup' do
  session.clear
  @user = User.create(username:params[:username], password:params[:password])
  session['user_id'] = @user.id
  redirect to '/'
end

get '/login' do
  erb :login
end