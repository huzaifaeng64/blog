class AddColumnToPlatformProducts < ActiveRecord::Migration[6.0]
  def change
  	add_column :platform_products, :status, :integer
  end
end
