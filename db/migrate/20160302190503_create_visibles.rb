class CreateVisibles < ActiveRecord::Migration
  def change
    create_table :visibles do |t|

      t.timestamps null: false
    end
  end
end
