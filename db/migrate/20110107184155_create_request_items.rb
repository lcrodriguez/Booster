class CreateRequestItems < ActiveRecord::Migration
  def self.up
    create_table :request_items do |t|
      t.references :request
      t.references :material
      t.integer :quantity
      t.integer :account_id

      t.timestamps
    end
    
    add_index :request_items, :account_id
  end

  def self.down
    drop_table :request_items
  end
end
