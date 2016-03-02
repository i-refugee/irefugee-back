class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :keyword, index: true
      t.references :need, index: true
      t.timestamps null: false
    end
  end
end
