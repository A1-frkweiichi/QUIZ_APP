class UserSessionsController < ApplicationController
  def destroy
    logout
    redirect_to root_path, status: :see_other, notice: t(".success")
  end

  def guest_login
    @guest_user = User.create(
      name: "ゲスト",
      email: "#{SecureRandom.alphanumeric(10)}@email.com",
      password: "password",
      password_confirmation: "password"
    )
    auto_login(@guest_user)
    redirect_to quizzes_path, success: "ゲストとしてログインしました"
  end
end
