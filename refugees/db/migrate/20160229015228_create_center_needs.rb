class CreateCenterNeeds < ActiveRecord::Migration
  def change
    create_table :center_needs do |t|
      t.references :center, index: true
      t.references :need, index: true
      t.text :description
      t.integer :importance
      t.timestamps null: false
    end
  end
end
