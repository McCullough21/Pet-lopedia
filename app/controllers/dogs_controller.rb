class DogsController < ApplicationController
    before_action :require_login

    def index
        if params[:breed_id]
            @breed = Breed.find_by(id: params[:breed_id])
            @dogs = @breed.dogs
        else
            @dogs = Dogs.all
        end
    end

    def qual_index
        breed = Breed.find_by(id: params[:breed_id])
        dog_set = breed.dogs
        @dogs = show_qualified(dog_set)
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
           render :new
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

    def show_qualified(dogs)
        dogs.reject do |dog|
          User.unqualified.include?(dog.user) 
        end   
    end
end
