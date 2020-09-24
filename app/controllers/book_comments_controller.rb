class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		book_comment = BookComment.new(book_comment_params)
		book_comment.book = book
		book_comment.user = current_user
		book_comment.save
		redirect_to request.referer
	end

	def destroy
		book = Book.find(params[:book_id])
		book_comment = current_user.book_comments.find_by(book_id: book.id, id: params[:id])
		book_comment.destroy
		redirect_to request.referer

	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment)
	end

end
