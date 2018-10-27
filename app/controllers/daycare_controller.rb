class DaycareController < ApplicationController

  get '/signup' do
    erb :'/signup'
  end
  
  get '/signup' do
    if logged_in?
      redirect to '/children'
    else
      erb :'/daycare/create_client'
    end
  end

  post '/signup' do
    client = Parent.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if client.client && client.username!= "" && client.email!="" && client.password!=""
      Parent.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = user.id
      redirect to '/daycare'
    else
      redirect to '/signup'
    end
  end

end
