class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "cookie_monster_saver"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end
