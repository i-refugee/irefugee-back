class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.references :center, index: true
      t.string :context
      t.timestamps null: false
    end
  end
end
