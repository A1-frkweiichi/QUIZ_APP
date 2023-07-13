class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]
  def self.from_omniauth(auth)
    user = find_or_create_user(auth)
    assign_user_attributes(user, auth)
    user.save
    user
  end

  def self.find_or_create_user(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid, deleted_at: nil) do |user|
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def self.assign_user_attributes(user, auth)
    user.name = auth.info.name
    user.email = auth.info.email
  end

  def self.guest
    find_or_create_by!(email: "#{SecureRandom.alphanumeric(10)}@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.name = "ゲストユーザー"
    end
  end

  def active_for_authentication?
    super && !deleted_at
  end
end
