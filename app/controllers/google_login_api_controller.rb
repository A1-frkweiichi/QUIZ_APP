# 参考記事 https://zenn.dev/yoiyoicho/articles/c44a80e4bb4515
class GoogleLoginApiController < ApplicationController
  # GoogleのIDトークンを検証するためのライブラリを読み込みます
  require "googleauth/id_tokens/verifier"

  # CSRF攻撃から保護しますが、callbackアクションは除外します
  protect_from_forgery except: :callback
  # 各アクションの前に、GoogleのCSRFトークンを検証します
  before_action :verify_g_csrf_token

  def callback
    # トークンを検証し、ユーザーを見つけてセッションを設定し、リダイレクトします
    verify_token_and_redirect
  end

  private

  def verify_token_and_redirect
    # GoogleのOIDCトークンを検証します
    payload = verify_oidc_token
    # ペイロードからユーザーを見つけるか作成します
    user = find_or_create_user(payload)
    # ユーザーのセッションを設定します
    user_session(user)
    # クイズのページにリダイレクトします
    redirect_to quizzes_path, notice: t(".success")
  end

  def verify_oidc_token
    # GoogleのOIDCトークンを検証します
    Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV.fetch("GOOGLE_CLIENT_ID"))
  end

  def find_or_create_user(payload)
    # ペイロードからユーザーを見つけるか作成します
    User.find_or_create_by(email: payload["email"])
  end

  def user_session(user)
    # ユーザーのセッションを設定します
    session[:user_id] = user.id
  end

  def verify_g_csrf_token
    # CSRFトークンが無効な場合、ルートパスにリダイレクトします
    redirect_to root_path, notice: t(".fail") if csrf_token_invalid?
  end

  def csrf_token_invalid?
    # CSRFトークンが欠落しているか無効であるかを確認します
    missing_token? || invalid_token?
  end

  def missing_token?
    # CSRFトークンが欠落しているかを確認します
    cookies["g_csrf_token"].blank? || params[:g_csrf_token].blank?
  end

  def invalid_token?
    # CSRFトークンが無効であるかを確認します
    cookies["g_csrf_token"] != params[:g_csrf_token]
  end
end
