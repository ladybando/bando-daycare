class DaycareController < ApplicationController
  get '/signup' do
    erb :'/signup'
  end

  get '/signup' do
    if logged_in?
      redirect to '/daycare'
    else
      erb :'/signup'
    end
  end

  post '/signup' do
    #binding.pry
    owner = Daycare.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if owner.save && owner.username!= "" && owner.email!="" && owner.password!=""
      Daycare.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = owner.id #search for session[:user_id] to correct error for views/daycare/index
      redirect to '/daycare'
    else
      redirect to '/signup'
    end
  end

  get '/daycare' do
    #bindin#g.pry
  if logged_in?
    @child = Child.all
    @parent = Parent.all
    redirect to '/daycare/show_client'
  else
    redirect to '/login'
  end
end

get '/daycare/index' do
  erb :'/daycare/index'
end

get '/daycare/show_client' do
  erb :'/daycare/show_client'
end

get '/login' do
  if !logged_in?
    erb :'/daycare/index'
  else
    redirect to '/daycare'
  end
end

post "/login" do
  owner = Daycare.find_by(:username => params[:username])
  if owner && owner.authenticate(params[:password])
    session[:user_id] = owner.id
    redirect to "/daycare"
  else
    redirect to "/signup"
  end
end

get '/logout' do
   if logged_in?
     session.destroy
     redirect to '/login'
   else
     redirect to '/'
   end
 end
end
