class PropertyTypesController < ApplicationController
    def new
        @property_type = PropertyType.new

    end

    def create
        @property_type = PropertyType.new(params.require(:property_type).permit(:title))
        if @property_type.save
            redirect_to @property_type
        else
            render :new
        end
    end

    def show
        @property_type = PropertyType.find(params[:id])
    end
end