class AddAccountToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :account_id, :integer
    remove_column :users, :subdomain
    
    add_index :users, :account_id
  end

  def self.down
    add_column :users, :subdomain, :string
    remove_column :users, :account_id  
  end
end
