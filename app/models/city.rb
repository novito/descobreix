class City < ActiveRecord::Base
  attr_accessible :name, :country_id

  has_many :experiences
  belongs_to :country
end
