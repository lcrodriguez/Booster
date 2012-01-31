class AddStatusToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :status, :string
  end

  def self.down
    remove_column :requests, :status
  end
end
