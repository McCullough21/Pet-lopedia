class DogsController < ApplicationController
    before_action :require_login

    def index
        # user id nested
    
    end
    
    def show
        # user id nested
    end

    def new
       
        @dog = Dog.new
    end

    def create
        raise params.inspect

        @dog.user_id = current_user.id

    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def dog_params
        params.require(:dog).permit(:name, :age, :description, :breed_id)
    end
end
