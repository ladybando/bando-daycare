class FamilyController < ApplicationController

  get '/family/index' do
    erb :'/family/index'
  end

  get '/family/create_client' do
    erb :'/family/create_client'
  end
 
  post '/family/create_client' do
    
  end
end
