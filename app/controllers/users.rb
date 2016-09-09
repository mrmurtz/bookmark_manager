

class BookmarkManager < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/links'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/users/login' do
        # if email exists on db, check password passed in params matches db password
    user = User.user_exists(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/links'
    else
      flash[:failed_login] = "Incorrect email or password"
      redirect 'users/login'
    end
  end

  post '/users/logout' do
    session[:user_id] = nil
    flash[:bye] = "See you again soon"
    redirect '/links'
  end


end
