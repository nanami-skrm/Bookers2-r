class BooksController < ApplicationController

	def create
		@book = Book.new(books_params)
		@book.user = current_user
		@book.save
		redirect_to book_path(@book)
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@new_book = Book.new
	end

	private
	def books_params
		params.require(:book).permit(:title, :body)
  	end
end
