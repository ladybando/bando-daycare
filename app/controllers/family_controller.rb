class FamilyController < ApplicationController

  get '/family' do
    erb :'/family/index'
  end

  get '/family/create_client' do
    erb :'/family/create_client'
  end


  post '/family/create_client' do
  #  binding.pry

    if logged_in?
      if params[:first_name] == "" || params[:last_name] == "" || params[:address] == "" || params[:phone_number] == ""
        redirect to '/family/create_client'
      else @parents = current_user.parents.create(first_name: params[:first_name], last_name: params[:last_name], address: params[:address], phone_number: params[:phone_number])
        if @parents.save
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
