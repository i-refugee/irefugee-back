class AddImageToCenters < ActiveRecord::Migration
  def change
  	add_column :centers, :image, :string
  end
end
