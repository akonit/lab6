class Category < ActiveRecord::Base

	has_many :links
    has_many :products, through: :links
	validates :name, presence: true
end
