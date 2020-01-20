class DogsController < ApplicationController
    before_action :require_login

    def index
        # breed id nested
    
    end
    
    def show
        @dog = Dog.find(params[:id])
    end

    def new
        if params[:user_id]
            @user = User.find_by(id: params[:user_id])
            @dog = @user.dogs.build
        else
            render '/login'
        end 
    end

    def create
        
        @dog = @user.dogs.build(dog_params)
        
        
        if @dog.save
        
        redirect_to user_path(@dog.user)
        else
        redirect_to new_dog_path
        end

    end

    def edit
        @dog = Dog.find_by(id: params[:id])

    end

    def update
        @dog = Dog.find_by(id: params[:id])
        @dog.update(dog_params)
        redirect_to user_path(@dog.user)

    end

    def destroy

    end

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :description, :breed_id)
    end
end
