class AddressReferencesToProfile < ActiveRecord::Migration[6.0]
  def change
  	add_reference :addresses, :profile, null: false, foreign_key: true
  end
end
