class PropertyLocationsController < ApplicationController
    def new
        @property_location = PropertyLocation.new
    end

    def create
        @property_location = PropertyLocation.create(params.require(:property_location).permit(:title))
        if @property_location.save
            redirect_to @property_location
        else
            render :new
        end
    end

    def show
        @property_location = PropertyLocation.find(params[:id])
    end
end