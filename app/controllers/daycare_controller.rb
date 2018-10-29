require "pry"
class DaycareController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'/signup', locals: {message: "Please sign up before you sign in!"}
    else
      redirect to '/daycare'
    end
  end

  post '/signup' do
    parent = Parent.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if parent.save && parent.username!= "" && parent.email!="" && parent.password!=""
        redirect to '/signup'
    else
      Parent.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = @parent.id
        redirect to '/daycare'
    end
  end

  get '/login' do
    if !logged_in?
      erb :'/login'
    else
      redirect to '/daycare'
    end
  end

  get '/daycare' do
   #binding.pry
    if logged_in?
        @parents = Parent.all
      erb :'/parent/index'
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
    redirect '/children'
  end
  if logged_in?
    @child = Child.find_by_id(params[:id])
    if @parents && @parents.username == current_user
        @child.delete
      end
      redirect to '/daycare'
    else
      redirect to '/login'
    end
  end
end
