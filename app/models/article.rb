class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	accepts_nested_attributes_for :comments, allow_destroy: true, reject_if: ->(attrs) { attrs['commentor'].blank? || attrs['cmnt_body'].blank? }
	validates :title, presence: true,
                    length: { minimum: 5 }
    validates :text, presence: true
    scope :created_before, ->(time) { where("created_at < ?", time) }
end
