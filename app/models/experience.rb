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
      where(['city_id = ?', city])
    end
    def by_title(title)
   	  where('title LIKE ? OR description LIKE ?', "%#{title}%", "%#{title}%")
    end
    def by_categories(categories)
    end
  end


  def self.search(search_params)
  	experiences = scoped
  	experiences = experiences.by_title(search_params[:title]) if search_params[:title]
  	experiences = experiences.by_city(search_params[:city]) if search_params[:city]
  	return experiences
  end

end
