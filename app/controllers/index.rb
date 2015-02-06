get '/' do
  # Look in app/views/index.erb
  user = User.find(session['user_id']) unless session['user_id'].nil?
  unless user.nil?
    @username = user.username
    @albums = user.albums.all
  end

  @random_photos = Photo.all.shuffle.shift(6)

  erb :index
end