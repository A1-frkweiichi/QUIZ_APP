class OauthsController < ApplicationController
  require 'googleauth'
  
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    payload = Google::Auth::IDTokens.verify_oidc(params[:credential], aud: ENV['GOOGLE_CLIENT_ID'])
    user = User.find_or_create_by(email: payload['email']) do |u|
      u.name = payload['name']
    end
    session[:user_id] = user.id
    redirect_to items_path, notice: t('google_login_api.callback.success')
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
