# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    user_from_omniauth
    sign_in @user, event: :authentication
    set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if is_navigational_format?
    redirect_to quizzes_path
  end

  def failure
    redirect_to root_path
  end

  private

  def user_from_omniauth
    @user = User.from_omniauth(request.env["omniauth.auth"])
  end
end
