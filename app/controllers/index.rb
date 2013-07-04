get '/' do
  @posts = Post.all

  erb :index
end

get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  @comments = Post.find(params[:post_id]).comments
  erb :post
end

get '/user/:user_id' do
  @user = User.find(params[:user_id])
  @posts = @user.posts
  @comments = @user.comments
  erb :user
end

get '/new' do
  erb :new
end

post '/new' do
  @user = User.new(params[:user])
  if @user.save!
    session[:user_id] = @user.id
    redirect to '/user/' + @user.id.to_s
  else
    redirect to '/login'
  end
  erb :new
end

post '/login' do
  user = User.authenticate(params[:user][:username], params[:user][:password])
  if user
    session[:user_id] = user.id
    redirect to '/user/' + user.id.to_s
  else
    redirect to '/new'
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
