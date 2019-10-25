class Platform < ApplicationRecord
	has_many :platform_products
	has_many :brands, through: :platform_products
end
