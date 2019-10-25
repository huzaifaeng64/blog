class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :color

      t.timestamps
    end
  end
end
