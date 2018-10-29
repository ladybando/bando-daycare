class FamilyController < ApplicationController

  get '/family' do
    erb :'/family/index'
  end

  get '/family/create_children' do
    erb :'/family/create_children'
  end

  post '/family/create_children' do
    if logged_in?
      if params[:first_name] == "" || params[:last_name] == ""
        redirect to '/family/create_children'
      else @child = current_user.children.create(first_name: params[:first_name], last_name: params[:last_name])
        if @child.save
          redirect to "/family/#{@child.id}"
        else
          redirect to '/family/create_children'
        end
      end
    else
      redirect to '/login'
    end
  end

  get '/family/:id' do
    if logged_in?
      @child = Child.find_by_id(params[:id])
      erb :'/family/show_children'
    else
      redirect to '/'
    end
  end

  get '/family/:id/edit' do
    if logged_in?
      @child = Child.find_by_id(params[:id])
      if @child == current_user
    erb :'/family/edit_child'
      else
        redirect to '/family'
    end
    else
      redirect to '/login'
    end
  end

    delete '/family/:id/delete' do
      if logged_in?
          @child = Child.find_by_id(params[:id])
        if @child && @child.first_name == current_user
          @child.delete
        end
        redirect to '/family'
      else
        redirect to '/login'
      end
    end
end
