class CreateNewsfeeds < ActiveRecord::Migration
  def change
    create_table :newsfeeds do |t|
      t.string :content
      t.integer :center_id
      t.string :model
      t.integer :model_id
      t.timestamps null: false
    end
  end
end
