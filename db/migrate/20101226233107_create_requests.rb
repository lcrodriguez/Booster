class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.string :name
      t.references :customer
      t.references :account

      t.timestamps
    end
    
    add_index :requests, :account_id
  end

  def self.down
    drop_table :requests
  end
end
