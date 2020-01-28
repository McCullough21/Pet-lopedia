class ApplicationController < ActionController::Base
   helper_method :current_user

    private
    def current_user
        @user ||= User.find_by(id: session[:id])
    end

    def logged_in?
        !!current_user
    end
    def require_login
        unless logged_in?
          redirect_to '/', alert: "You must log in or sign up"
        end
    end

end
