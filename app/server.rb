
class BookmarkManager < Sinatra::Base

    enable :sessions
    register Sinatra::Flash
    register Sinatra::Partial
    set :session_secret, 'super secret'
    set :partial_template_engine, :erb

    enable :partial_underscores

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
