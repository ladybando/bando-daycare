class ParentController < ApplicationController

  get '/children' do
    if logged_in?
      @child = Child.all
      erb :'/parent/index'
    else
      redirect to '/login'
    end
  end
end
