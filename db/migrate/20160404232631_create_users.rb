class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :nickname
      t.string :email
      t.string :image
      t.string :uid
      t.string :oauth_token
      t.string :secret_token

      t.timestamps null: false
    end
  end
end
