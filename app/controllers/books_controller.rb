class BooksController < ApplicationController
	before_action :authenticate_user!

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
		@book_comment = @book.book_comment.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		book.update(books_params)
		redirect_to book_path(book)
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to books_path
	end

	private
	def books_params
		params.require(:book).permit(:title, :body)
  	end
end
