class Comment < ApplicationRecord
  belongs_to :article, optional: true
 # scope :published, -> {where(id: 1) }
 # enum cmnt_body: [:active, :inactive]
 validates :commentor, presence: true
 validates :cmnt_body, presence: true

end
