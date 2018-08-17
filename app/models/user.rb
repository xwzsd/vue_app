class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_one :user_profile, dependent: :destroy

  before_create :callback_before_create

  validates :email, :password, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  def callback_before_create
    build_user_profile
    true
  end
end
