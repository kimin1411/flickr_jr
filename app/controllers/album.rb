post '/upload' do
  if session['user_id'].nil?
    redirect to '/login'
  else
    Album.find(params[:album_id]).photos.create(file: params[:image])
    redirect to "/albums/#{params[:album_id]}"
  end
end

get '/user/:user_id/albums' do
  @albums = User.find(params[:user_id]).albums.all
  erb :album_list
end

get '/albums/:album_id' do
  @album = Album.find(params[:album_id])
  @photos = @album.photos.all
  erb :album
end

post '/createalbum' do
  redirect to '/login' if session['user_id'].nil?
  User.find(session['user_id']).albums.create(name: params[:album])
  redirect to '/'
end

get '/albums/:album_id/:photo_id' do
  @photo = Photo.find(params[:photo_id])
  erb :photo
end