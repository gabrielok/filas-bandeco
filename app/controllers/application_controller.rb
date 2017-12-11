class ApplicationController < ActionController::Base
  
    def homepage
      @user_1 = User.where(restaurant: 1)
    end
end
