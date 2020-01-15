class UsersController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:home, :new, :create, :login]

    def home
        
    end
    
    def show
        @user = User.find_by(id: params[:id])
    end

    def new
        @user = User.new
        @user.dogs.build
        
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
        
        @user = User.new(user_params)
        
        if @user.save
        session[:id] = @user.id
        redirect_to user_path(@user)
        else 
            redirect_to '/'
        end
    end

    def edit

    end

    def update

    end

    def logout
        session.destroy
        redirect_to '/'
    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :qualification, 
        dogs_attributes: [:name, :age, :description, :breed_id])
    end

    # def breed
    #     params[:breed_id].select{|n| n != nil}.to_i
    # end

    def require_login
        unless logged_in?
          redirect_to '/', alert: "You must log in or sign up"
        end
      end

end
