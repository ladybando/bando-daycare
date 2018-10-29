class FamilyController < ApplicationController

  get '/children' do
    if logged_in?
        @children = Child.all
      erb :'/children/index'
    else
      redirect to '/daycare'
    end
  end

  get '/children/new' do
    erb :'/children/create_children'
  end

  get '/daycare/:id' do
    binding.pry
    if logged_in?
      @parents = Parent.find_by_id(params[:id])
      erb :'parent/show_parent'
    else
      redirect to '/'
    end
  end

  get '/daycare/:id/edit' do
    if logged_in?
      @parents = Parent.find_by_id(params[:id])
    if @parent && @parent.username == current_user
        erb :'parent/edit_parent'
      else
        redirect to '/daycare'
      end
    else
      redirect to '/login'
    end
  end

  post '/children/create_children' do
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

  get '/children/:id' do
    if logged_in?
      @child = Child.find_by_id(params[:id])
      erb :'/family/show_children'
    else
      redirect to '/'
    end
  end

  get '/children/:id/edit' do
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

    delete '/children/:id/delete' do
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
