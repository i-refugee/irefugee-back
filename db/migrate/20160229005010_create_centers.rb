class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.text :description
      t.string :address
      t.string :name
      t.string :phone_number
      t.string :email
      t.string :password_digest
      t.string :contact_email
      t.string :latitude
      t.string :longitude
      t.integer :center_type
      t.integer :refugees_number
      t.timestamps null: false
    end
  end
end
