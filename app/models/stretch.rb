class Stretch < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :picture, presence: true
end
