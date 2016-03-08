class AddSlugToCenters < ActiveRecord::Migration
  def change
  	add_column :centers, :slug, :string, index: true, unique: true
  end
end
