class UsersController < ApplicationController

    def home

    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
    end

    def login
        

    end

    def create
        
        @user = User.create(user_params)
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

end
