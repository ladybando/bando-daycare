require "pry"
class DaycareController < ApplicationController
  get '/signup' do
    erb :'daycare/signup'
  end

  get '/signup' do
    if !logged_in?
      erb :'/signup', locals: {message: "OOPS, maybe your password is incorrect! Please create an account\, before you log in!"}
    else
      redirect to '/daycare'
    end
  end

  post '/signup' do
    parent = Parent.new(:username => params[:username], :password => params[:password], :email => params[:email])
    owner = Daycare.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if owner.save && owner.username!= "" && owner.email!="" && owner.password!=""
      Daycare.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = owner.id
        redirect to '/daycare'
        if parent.save && parent.username!= "" && parent.email!="" && parent.password!=""
          Parent.create(:username => params[:username], :password => params[:password], :email => params[:email])
          session[:user_id] = parent.id
            redirect to '/family'
      else
        redirect to '/signup'
    end
      else
        redirect to '/signup'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/login'
    elsif logged_in? && current_user == owner
      redirect to '/daycare'
    else
      redirect to '/family'
    end
  end

  get '/daycare' do
   #binding.pry
  if logged_in?
    @owners = Parent.all
    erb :'/daycare/index'
  else
    redirect to '/login'
  end
end

post '/daycare' do
  binding.pry
  if logged_in?
    if params[:username] == "" || params[:password] == ""
      redirect to '/family/create_client'
    else @parent= current_user.parentss.create(username: params[:username], password: params[:password])
      if @parent.save
        redirect to "/daycare/#{@parent.id}"
      else
        redirect to '/daycare/create_owner'
      end
    end
  else
    redirect to '/family/login'
  end
end

get '/daycare/:id' do
  if logged_in?
    @parents = Parent.find_by_id(params[:id])
    erb :'/daycare/create_owner'
  else
    redirect to '/'
  end
end

post "/login" do
  @parents = Parent.find_by(:username => params[:username])
  if @parents && @parents.authenticate(params[:password])
    session[:user_id] = @parents.id
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
    @parents = Parent.find_by_id(params[:id])
    if @parents && @parents.username == current_user
        @parents.delete
      end
      redirect to '/daycare'
    else
      redirect to '/login'
    end
  end
end
