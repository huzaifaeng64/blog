class Brand < ApplicationRecord
	has_many :platform_products
	has_many :platforms, through: :platform_products
end
