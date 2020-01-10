class ApplicationController < ActionController::Base


    private
    def current_user
        @user ||= User.find_by(id: session[:id])
    end

    def logged_in?
        !!current_user
    end
    # def require_login
#     return head(:forbidden) unless session.include? :user_id
# end

end
