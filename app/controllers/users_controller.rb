class UsersController < ApplicationController

  before_action :edit_data, only: [:edit]

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

  def edit_data
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
