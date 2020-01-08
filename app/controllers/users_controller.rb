class UsersController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:home, :new, :create]
    def home
        
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end

    def login
        
        @user = User.find_by(:username => params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:id] = @user.id
            redirect_to user_path(@user.id)
        else
            redirect_to '/'
        end
        
    end

    def create
        
        @user = User.create(user_params)
        session[:id] = @user.id
        redirect_to user_path(@user)
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :qualification)
    end

    # def require_login
    #     unless logged_in?
    #       flash[:error] = "You must be logged in to access this section"
          
    #     end
    #   end

end
