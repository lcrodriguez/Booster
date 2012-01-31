class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.references :account

      t.timestamps
    end
    
    add_index :customers, :account_id
  end

  def self.down
    drop_table :customers
  end
end
