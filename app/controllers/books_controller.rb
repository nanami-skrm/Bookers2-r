class BooksController < ApplicationController

	def index
		@user = current_user
		@book = Book.new
		@books = Book.all
	end

	def create
		@book = Book.new(books_params)
		@book.user = current_user
		if @book.save
			redirect_to book_path(@book), notice: "You have creatad book successfully."
		else
			@user = current_user
			@book = Book.new
			@books = Book.all
			render :index
		end
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
