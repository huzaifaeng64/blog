class PlatformProduct < ApplicationRecord
  belongs_to :platform
  belongs_to :brand
end
