class Product < ActiveRecord::Base
	has_many :opinions, dependent: :destroy
	has_many :links
    has_many :categories, through: :links
	has_many :ratings
	validates :name, presence: true
	validates :description, presence: true

	def self.search(search)
	    if search
	    	find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
	    else
	    	find(:all)
	    end
	end

	def average_rating
		if self.ratings.size == 1
			0.0
		else
    		self.ratings.sum(:score) / (self.ratings.size - 1)
    	end
	end
end
