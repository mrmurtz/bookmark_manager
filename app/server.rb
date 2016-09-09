
class BookmarkManager < Sinatra::Base

    enable :sessions
    set :session_secret, 'super secret'
    set :partial_template_engine, :erb
    register Sinatra::Flash
    register Sinatra::Partial

    get '/' do
      "welcome to book mark manager extraordinaire"
      redirect '/links'
    end

    helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
    end
  end
