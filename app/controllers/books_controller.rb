class BooksController < ApplicationController

	def create
		@book = Book.new(books_params)
		@book.save
		redirect_to book_path(@book.id)
	end

	def show
	end

	private
	def books_params
		params.require(:book).permit(:title, :body)
  	end
end
