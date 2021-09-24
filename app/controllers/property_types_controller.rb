class PropertyTypesController < ApplicationController
    def new
        @property_type = PropertyType.new

    end

    def create
        @all_property_types = []
        PropertyType.all.each {|t| @all_property_types << t[:title]}

        if @all_property_types.include?(params[:property_type][:title])
            redirect_to new_property_type_path
            flash[:notice] = 'Não foi possível cadastrar: este nome já foi usado'
        else
            prop_type = PropertyType.create(params.require(:property_type).permit(:title))
            if prop_type.save
                redirect_to prop_type
            else
                redirect_to new_property_type_path
                flash[:notice] = 'Não foi possível cadastrar: nome inválido'
            end
        end
    end

    def show
        @property_type = PropertyType.find(params[:id])
    end
end