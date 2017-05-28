class BodyArea < ActiveRecord::Base
  has_many :body_area_stretches
  has_many :stretches, through: :body_area_stretches
  validates :name, presence: true, uniqueness: true
end
