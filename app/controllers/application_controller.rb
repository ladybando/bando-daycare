require "pry"
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  #use Rack::Flash
  
  set :session_secret, "cookie_monster_saver"
  set :views, Proc.new { File.join(root, "../views/") }

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
      @current_user ||= User.find_by(id: session[:user_id])  if session[:user_id] #must refactor no user class
    end

  #   def age_group(age)
  #     age = gets.strip.to_i
  #     if age.between?(0-5)
  #       age = @toddlers
  #     elsif age.between?(6-10)
  #       age = @littles
  #     else age.between?(10-15)
  #       age = @pre_teen
  #     end
  #   end
  #
  #   def call
  #     age_group(age)
  #   end
   end
end
