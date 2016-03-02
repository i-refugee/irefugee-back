class CreateTokens < ActiveRecord::Migration
  def change
    create_table :tokens do |t|
      t.references :center, index: true
      t.references :admin, index: true
      t.string :auth_token


      t.timestamps null: false
    end
    add_index :tokens, :auth_token, unique: true
  end
end
