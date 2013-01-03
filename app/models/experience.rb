class Experience < ActiveRecord::Base
  attr_accessible :description, :city_id, :price, :title, :user_id
  attr_accessible :category_ids

  validates :title, :description, :user_id, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :user
  belongs_to :city
  has_and_belongs_to_many :categories
end
