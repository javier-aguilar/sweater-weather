class User < ApplicationRecord
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  has_secure_password

  after_create :set_api_key

  private

  def set_api_key
    update(api_key: generate_api_key)
  end

  def generate_api_key
    SecureRandom.base58(24)
  end
end
