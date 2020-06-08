class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  has_secure_password

  after_create :set_api_key

  def set_api_key
    update_column(:api_key, generate_api_key)
  end

  private

  def generate_api_key
    SecureRandom.base58(24)
  end
end
