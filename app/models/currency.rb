class Currency < ActiveRecord::Base
  attr_accessible :name, :symbol, :countries_id
  
  has_many :countries
end
