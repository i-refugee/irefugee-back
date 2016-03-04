class CreateCenterKeywords < ActiveRecord::Migration
  def change
    create_table :center_keywords do |t|
      t.references :center, index: true
      t.references :keyword, index: true
      t.timestamps null: false
    end
  end
end
