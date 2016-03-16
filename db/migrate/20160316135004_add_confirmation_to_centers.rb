class AddConfirmationToCenters < ActiveRecord::Migration
  def change
  	add_column :centers, :confirmed, :boolean, default: false
  end
end
