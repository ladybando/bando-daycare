class DaycareController < ApplicationController

  get "/signup" do
    if logged_in?
      #redirect to '/daycare'
    end
  end

end
