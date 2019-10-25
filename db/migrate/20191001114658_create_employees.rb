class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.references :manager
      t.references :leader

      t.timestamps
    end
  end
end
