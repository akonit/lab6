class Product < ActiveRecord::Base
	has_many :opinions, dependent: :destroy
	has_many :links
    has_many :categories, through: :links
	validates :name, presence: true
	validates :description, presence: true

	def self.search(search)
	    if search
	    	find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
	    else
	    	find(:all)
	    end
	end
end
