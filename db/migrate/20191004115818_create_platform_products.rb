class CreatePlatformProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :platform_products do |t|
      t.references :platform, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
