class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @quizzes = @user.quizzes
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
