require "pry"
class DaycareController < ApplicationController
  get '/signup' do
    erb :'/signup'
  end

  get '/signup' do
    if !logged_in?
      erb :'/signup', locals: {message: "OOPS, maybe your password is incorrect! Please create an account\, before you log in!"}
    else
      redirect to '/daycare'
    end
  end

  post '/signup' do
    #binding.pry
    owner = Daycare.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if owner.save && owner.username!= "" && owner.email!="" && owner.password!=""
      Daycare.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = owner.id
      redirect to '/daycare'
    else
      redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/daycare/login'
    else
      redirect to '/daycare'
    end
  end

  get '/daycare' do
   #binding.pry
  if logged_in?
    @owners = Daycare.all
    erb :'/daycare/index'
  else
    redirect to '/login'
  end
end

post '/daycare' do
  if logged_in?
    if params[:username] == "" || params[:password] == ""
      redirect to "/daycare/create_owner"
    else
      @owners = current_user.daycares.create(name: params[:username], password: params[:password])
      if @owners.save
        redirect to "/daycare/#{@owners.id}"
      else
        redirect to "/daycare/create_owner"
      end
    end
  else
    redirect to '/login'
  end
  #binding.pry
end

get '/daycare/:id' do
  if logged_in?
    @owners = Daycare.find_by_id(params[:id])
    erb :'/daycare/show_owners'
  else
    redirect to '/login'
  end
end

post "/login" do
  @owners = Daycare.find_by(:username => params[:username])
  if @owners && @owners.authenticate(params[:password])
    session[:user_id] = @owners.id
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

 delete '/daycare/:id/delete' do
  if logged_in?
    @owners = Daycare.find_by_id(params[:id])
    if @owners && @owners.username == current_user
        @owners.delete
      end
      redirect to '/daycare'
    else
      redirect to '/login'
    end
  end
end
