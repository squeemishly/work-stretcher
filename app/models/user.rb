class User < ActiveRecord::Base
  has_secure_password
  has_many :favorites
  has_many :stretches, through: :favorites

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  enum role: ["default", "admin"]
end
