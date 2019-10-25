class Post < ApplicationRecord
	validates_presence_of :title, message: " title is required."
	validates_presence_of :text, message: " text is required."
end
