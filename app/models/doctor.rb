class Doctor < ApplicationRecord
	has_many :appointments
	has_many :patients, thorugh: :appointments
	has_many :pictures, as: :image
end
