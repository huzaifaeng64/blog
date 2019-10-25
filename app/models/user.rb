class User < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, presence: true
	validates :image, file_Size: { less_than: 1000.kilobytes }
end
