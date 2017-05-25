class Stretch < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :picture, presence: true
  has_many :body_area_stretches
  has_many :body_areas, through: :body_area_stretches
end
