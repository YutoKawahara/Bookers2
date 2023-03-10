class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @users = User.all
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

private
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
