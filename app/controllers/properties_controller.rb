class PropertiesController < ApplicationController
    def show
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.create(params.require(:property).permit(:title, :description, :rooms, :bathrooms, :pets, :parking_slot, :daily_rate))
        if @property.save
            redirect_to @property
        else
            flash.now[:notice] = 'Não foi possível cadastrar'
            render :new
        end
    end
end