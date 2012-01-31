class CreateMaterialCategories < ActiveRecord::Migration
  def self.up
    create_table :material_categories do |t|
      t.string :name
      t.references :account

      t.timestamps
    end
    
    add_index :material_categories, :account_id
  end

  def self.down
    drop_table :material_categories
  end
end
