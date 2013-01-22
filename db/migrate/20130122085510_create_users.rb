class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :password
      t.string :password_digest
      t.string :avatar
      t.string :url

      t.timestamps
    end
  end
end
