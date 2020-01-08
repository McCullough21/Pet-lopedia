class User < ApplicationRecord
    has_many :dogs
    has_many :breeds, through: :dogs
    has_secure_password
    scope :qualified, -> {where qualification: !nil}
    # skip_before_action :require_login, only: [:index]

    def current_user
        @user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
end
