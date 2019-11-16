class UsersController < ApplicationController

  def index
  	@users = User.all
  	@book_new = Book.new
  	@user = current_user
  end

  def show
  	@user = User.find(params[:id])
  	@book_new = Book.new
  	@books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.id == current_user.id
    if @user.update(user_params)
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
