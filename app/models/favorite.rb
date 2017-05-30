class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :stretch
  has_one :note
end
