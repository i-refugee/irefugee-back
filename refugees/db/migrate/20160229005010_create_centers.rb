class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.text :description
      t.string :address
      t.string :name
      t.integer :phone_number
      t.string :email
      t.string :password_digest
      t.string :contact_email
    end
  end
end
