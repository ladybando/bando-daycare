require "pry"
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
  set :public_folder, 'public'
  set :views, 'app/views'
  enable :sessions
  set :session_secret, "cookie_monster_saver"
end

  get '/' do
    erb :index
  end

#this helper method will take in the childs age and place them
#in the correct age group

   helpers do
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
