class HomeController < ApplicationController
    def index
        @properties = Property.all
        @property_types = PropertyType.all
        flash[:notice] = 'Nenhum imóvel disponível' unless @properties.present?
    end
end