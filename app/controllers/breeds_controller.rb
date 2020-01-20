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
    params.require(:breed).permit(:name, :female_height_min, :female_height_max, :male_height_min, :male_height_max,
    :female_weight_min, :female_weight_max, :male_weight_min, :male_weight_max, :description)
end

end
