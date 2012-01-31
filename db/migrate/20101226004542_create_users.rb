class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      
      t.string :username
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :subdomain
      t.string :first_name
      t.string :last_name
      t.integer :user_type_id
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
