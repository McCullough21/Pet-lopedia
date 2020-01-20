class BreedsController < ApplicationController

    def index
        @breeds = Breed.all
    end

    def show
        @breed = Breed.find_by(id: params[:id])
    end

    def new
        @breed = Breed.new
    end

    def create
        @breed = Breed.new(breed_params)

        if @breed.save
            redirect_to breeds_path
        else
            redirect_to new_breed_path
        end

    end

    def edit

    end

    def update

    end

    def destroy
        
    end

private

def breed_params
    params.require(:breed).permit(:name, :height, :weight, :description)
end

end
