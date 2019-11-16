class BooksController < ApplicationController

	def index
		@books = Book.all
		@book = Book.new
		@current_user = current_user
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book)
			flash[:notice] = "You have created book successfully."
		else
		  @books = Book.all
		  @users = User.all
		  @user = current_user
		  render :index
		end
	end

	def show
		@book = Book.find(params[:id])
		@book_new = Book.new
		@user = User.find_by(id: @book.user_id)
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book= Book.find(params[:id])
		@book.user_id = current_user.id
		if @book.update(book_params)
		  redirect_to book_path(@book)
		  flash[:notice] = "You have updated book successfully."
		else
		  render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.user_id = current_user.id
		@book.destroy
		redirect_to books_path
	end

	private

	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end

end
