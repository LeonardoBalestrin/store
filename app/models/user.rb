class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_one_attached :featured_image
  has_rich_text :description

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
