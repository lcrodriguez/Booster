class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.string :name
      t.string :code
      t.integer :account_id

      t.timestamps
    end
    
    add_index :states, :account_id
  end

  def self.down
    drop_table :states
  end
end
