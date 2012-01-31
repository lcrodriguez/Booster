class CreateUserTypes < ActiveRecord::Migration
  def self.up
    create_table :usertypes do |t|
      t.string :name
      t.boolean :is_admin
      t.integer :account_id

      t.timestamps
    end
    
    add_index :usertypes, :account_id
  end

  def self.down
    drop_table :usertypes
  end
end
