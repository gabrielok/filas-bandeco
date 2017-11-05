class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    def homepage
      render :test
    end
end
