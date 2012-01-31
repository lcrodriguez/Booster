class AddInfoToMaterial < ActiveRecord::Migration
  def self.up
    add_column :materials, :code, :string
    add_column :materials, :description, :string
  end

  def self.down
    remove_column :materials, :code
    remove_column :materials, :description
  end
end
