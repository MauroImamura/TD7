class HomeController < ApplicationController
    def index
        @properties = Property.all

        flash[:notice] = 'Nenhum imóvel disponível' unless @properties != []
    end
end