class CreateMaterials < ActiveRecord::Migration
  def self.up
    create_table :materials do |t|
      t.string :name
      t.references :material_category
      t.references :account

      t.timestamps
    end
    
    add_index :materials, :account_id
    
  end

  def self.down
    drop_table :materials
  end
end
