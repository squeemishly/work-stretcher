class Stretch < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :picture, presence: true
end
