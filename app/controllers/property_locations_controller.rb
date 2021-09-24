class PropertyLocationsController < ApplicationController
    def new
        @property_location = PropertyLocation.new
    end

    def create
        @all_property_locations = []
        PropertyLocation.all.each {|l| @all_property_locations << l[:title]}

        if @all_property_locations.include?(params[:property_location][:title])
            redirect_to new_property_location_path
            flash[:notice] = 'Não foi possível cadastrar: este nome já foi usado'
        else
            prop_location = PropertyLocation.create(params.require(:property_location).permit(:title))
            if prop_location.save
                redirect_to prop_location
            else
                redirect_to new_property_location_path
                flash[:notice] = 'Não foi possível cadastrar: nome inválido'
            end
        end
    end

    def show
        @property_location = PropertyLocation.find(params[:id])
    end
end