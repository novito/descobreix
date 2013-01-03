class Country < ActiveRecord::Base
  attr_accessible :name, :cities_id, :currency_id

  has_many :cities
  belongs_to :currency
end
