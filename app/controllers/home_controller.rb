class HomeController < ApplicationController
    def index
        @properties = Property.all
        @property_types = PropertyType.all
        @property_locations = PropertyLocation.all
        #flash[:notice] = 'Nenhum imóvel disponível' unless @properties.present?
        #TODO mudar mensagem flash da home para nenhum imóvel cadastrado, está dando conflito com a mensagem de login
    end
end