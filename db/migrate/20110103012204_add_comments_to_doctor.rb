class AddCommentsToDoctor < ActiveRecord::Migration
  def self.up
    add_column :doctors, :comments, :string
  end

  def self.down
    remove_column :doctors, :comments
  end
end
