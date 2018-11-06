require "pry"
class ApplicationController < Sinatra::Base
  include ActionController::Base
  register Sinatra::ActiveRecordExtension
  before_filter :require_login

  configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "cookie_monster_saver"
end

  get '/' do
    erb :index
  end

  helpers do
    private

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        render :controller => 'home', :action => 'logout'
      else
        # whatever code you need to load from user
        render :controller => 'home', :action => 'logged_in'
      end
    end

     def logged_in?
      !!current_user
    end

    def current_user
      # @parent = Parent.find_by(id: session[:user_id])
      # @daycare = Daycare.find_by(id: session[:user_id])
      # @current_user ||= @parent || @daycare  if session[:user_id] #searches for if user is owner or parent
      @current_user ||= Parent.find_by(id: session[:user_id])  if session[:user_id] #must refactor no user class
   end

   end
end
