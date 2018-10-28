class DaycareController < ApplicationController
  get '/signup' do
    erb :'/signup'
  end

  get '/signup' do
    if logged_in?
      redirect to '/daycare'
    else
      erb :'/daycare/new_client'
    end
  end

  post '/signup' do
    #binding.pry
    client = Parent.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if client.save && client.username!= "" && client.email!="" && client.password!=""
      Parent.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = client.id
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
    erb :'/daycare/index'
  else
    redirect to '/login'
  end
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
