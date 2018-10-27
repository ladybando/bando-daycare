class ChildController < ApplicationController

  get '/children' do
    if logged_in?
      @child = Child.all
      erb :'/child/index'
    else
      redirect to '/login'
    end
  end

end
