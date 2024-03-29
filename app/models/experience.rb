class Experience < ActiveRecord::Base
  attr_accessible :description, :city_id, :price, :title, :user_id
  attr_accessible :category_ids

  validates :title, :description, :user_id, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }

  belongs_to :user
  belongs_to :city
  has_and_belongs_to_many :categories

  # Arel helpers
  class << self
    def by_city(city)
      where(['experiences.city_id = ?', city])
    end
    def by_keywords(keywords)
   	  where("experiences.title LIKE ? OR experiences.description LIKE ?", "%#{keywords}%", "%#{keywords}%")
    end
    def by_categories(categories)
      joins(:categories).where('category_id IN (?)', categories)
    end
  end


  def self.search(search_params)
  	experiences = scoped
  	experiences = experiences.by_keywords(search_params[:keywords]) if search_params[:keywords]
  	experiences = experiences.by_city(search_params[:city]) if search_params[:city] && !search_params[:city].blank?
    experiences = experiences.by_categories(search_params[:categories]) if search_params[:categories]
  	return experiences
  end

end
