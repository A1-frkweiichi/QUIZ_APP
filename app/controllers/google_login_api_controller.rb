# 参考記事 https://zenn.dev/yoiyoicho/articles/c44a80e4bb4515
class GoogleLoginApiController < ApplicationController
  require "googleauth/id_tokens/verifier"

  protect_from_forgery except: :callback
  before_action :verify_g_csrf_token

  def callback
    verify_token_and_redirect
  end

  private

  def verify_token_and_redirect
    payload = verify_oidc_token
    user = find_or_create_user(payload)
    user_session(user)
    redirect_to quizzes_path, notice: t(".success")
  end

  def verify_oidc_token
    Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV.fetch("GOOGLE_CLIENT_ID"))
  end

  def find_or_create_user(payload)
    User.find_or_create_by(email: payload["email"])
  end

  def user_session(user)
    session[:user_id] = user.id
  end

  def verify_g_csrf_token
    redirect_to root_path, notice: t(".fail") if csrf_token_invalid?
  end

  def csrf_token_invalid?
    missing_token? || invalid_token?
  end

  def missing_token?
    cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank?
  end

  def invalid_token?
    cookies["g_csrf_token"] != params[:g_csrf_token]
  end
end
