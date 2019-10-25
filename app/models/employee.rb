class Employee < ApplicationRecord
	has_many :subordinates, class_name: "Employee",
							foreign_key: "manager_id"

	belongs_to :manager, class_name: "Employee", optional: true

	has_many :subcordinates, class_name: "Employee",
							foreign_key: "leader_id"

	belongs_to :leader, class_name: "Employee", optional: true
end
