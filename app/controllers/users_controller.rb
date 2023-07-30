class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @total_answers = @user.answers.count
    @correct_answers = @user.answers.joins(:choice).where(choices: { is_correct: true }).count
    @correct_rate = @total_answers.zero? ? 0 : (@correct_answers.to_f / @total_answers * 100).round(1)
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
