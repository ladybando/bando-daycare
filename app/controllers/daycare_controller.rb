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
    parent = Parent.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if parent.save && parent.username!= "" && parent.email!="" && parent.password!=""
      Parent.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = parent.id
        redirect to '/daycare'
      else
        redirect to '/signup'
    end
  end

  get '/daycare' do
   #binding.pry
  if logged_in?
    @parents = Parent.all
    erb :'/daycare/index'
  else
    redirect to '/login'
  end
end

post '/daycare' do
  if logged_in?
    if params[:username] == "" || params[:password] == ""
      redirect to '/daycare/create_client'
    else @parent= current_user.parents.create(username: params[:username], password: params[:password])
      if @parent.save
        redirect to "/daycare/#{@parent.id}"
      else
        redirect to '/daycare/create_client'
      end
    end
  else
    redirect to '/login'
  end
end

  get '/login' do
    if !logged_in?
      erb :'/login'
    else
      redirect to '/daycare'
    end
  end

get '/daycare/:id' do
  if logged_in?
    @parents = Parent.find_by_id(params[:id])
    erb :'/daycare/show_client'
  else
    redirect to '/'
  end
end

get '/daycare/:id/edit' do
  if logged_in?
    @child = Child.find_by_id(params[:id])
    @child == current_user
    redirect to 'family/:id/edit'

    @parents = Parent.find_by_id(params[:id])
  if @parent && @parent.username == current_user
      erb :'daycare/edit_client'
    else
      redirect to '/daycare'
    end
  else
    redirect to '/login'
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
    @child = Child.find_by_id(params[:id])
    @child == current_user
    @child.delete
    redirect '/family'
  end
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
