class AddStateToDoctor < ActiveRecord::Migration
  def self.up
    add_column :doctors, :state_id, :integer
  end

  def self.down
    remove_column :doctors, :state_id
  end
end
