require "pry"
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
  #  binding.pry
  if logged_in?
    @owner = Daycare.all
    redirect to '/daycare/index'
  else
    redirect to '/login'
  end
end

post '/daycare' do
  binding.pry
  if logged_in?
    if params[:username] == ""
      redirect to "/daycare/create_owners"
    else
      @owner = current_user.daycares.create(name: params[:username])
      if @owner.save
        redirect to "/daycare/#{@owner.id}"
      else
        redirect to "/daycare/create_owner"
      end
    end
  else
    redirect to '/login'
  end
  binding.pry
end

get '/daycare/:id' do
  if logged_in?
    @owner = Daycare.find_by_id(params[:id])
    erb :'/daycare/show_owners'
  else
    redirect to '/login'
  end
end

get '/daycare/show_owners' do
  erb :'/daycare/show_owners'
end

get '/daycare/create_owner' do
  erb :'/daycare/create_owner'
end

post '/daycare/create_owner' do
  erb :'/daycare/create_owner'
end

get '/login' do
  if !logged_in?
    erb :'/index'
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
