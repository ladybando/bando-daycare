class FamilyController < ApplicationController

  get '/family' do
    erb :'/family/index'
  end

  get '/family/create_client' do
    erb :'/family/create_client'
  end

  get 'family/signup' do
    if !logged_in?
      erb :'/signup', locals: {message: "OOPS, maybe your password is incorrect! Please create an account\, before you log in!"}
    else
      redirect to '/family'
    end
  end

  post 'family/signup' do
    #binding.pry
    parent =  Parent.new(:username => params[:username], :password => params[:password], :email => params[:email])
    if parent.save && parent.username!= "" && parent.email!="" && parent.password!=""
      Parent.create(:username => params[:username], :password => params[:password], :email => params[:email])
      session[:user_id] = parent.id
      redirect to '/family'
    else
      redirect to '/signup'
    end
  end

  post "/family/login" do
    @parents = Parents.find_by(:username => params[:username])
    if @parents && @parents.authenticate(params[:password])
      session[:user_id] = @parents.id
      redirect to "/family"
    else
      redirect to "/signup"
    end
  end

  post '/family/create_client' do
    if logged_in?
      if params[:first_name] == "" || params[:last_name] == "" || params[:address] == "" || params[:phone_number] == ""
        redirect to '/family/create_client'
      else @parents = current_user.parents.create(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], phone_number: params[:phone_number]  ) && @child = current_user.children.create(first_name: params[:first_name], last_name: params[:last_name])
        if @parents.save && @children.save
          redirect to "/family/#{@parents.id}"
        else
          redirect to '/family/create_client'
        end
      end
    else
      redirect to '/family/login'
    end
  end

  get '/family/:id' do
    if logged_in?
      @parent = Parent.find_by_id(params[:id])
      @child = Child.find_by_id(params[:id])
      erb :'/family/show_client'
    else
      redirect to '/login'
    end
  end
 #
 #  delete '/daycare/:id/delete' do
 #   if logged_in?
 #     @parent = Parent.find_by_id(params[:id])
 #     if @parent && @parent.first_name == current_user
 #       @parent.delete
 #     end
 #     redirect to '/family'
 #   else
 #     redirect to '/login'
 #   end
 # end
end
