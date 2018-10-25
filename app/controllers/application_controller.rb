class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "cookie_monster_saver"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

#this helper method will take in the childs age and place them
#in the correct age group

  # helpers do
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
  # end
end
