class PropertyBooksController < ApplicationController
    def show
        @property_book = PropertyBook.find(params[:id])
    end

    def create
        @property_book = current_user.property_books.new(params.require(:property_book).permit(:start_date,:end_date,:guests))
        @property_book.property = Property.find(params[:property_id])
        @property_book.save!

        redirect_to @property_book, notice: 'Pedido enviado com sucesso!'
    end
end