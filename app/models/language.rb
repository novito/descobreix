class Language < ActiveRecord::Base
  attr_accessible :name
  has_many :proficiencies, :dependent => :destroy
  has_many :users, :through => :proficiencies
end
