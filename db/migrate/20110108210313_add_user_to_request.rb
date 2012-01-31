class AddUserToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :user_id, :integer
    add_column :requests, :description, :string
  end

  def self.down
    remove_column :requests, :user_id
    remove_column :requests, :description
  end
end
