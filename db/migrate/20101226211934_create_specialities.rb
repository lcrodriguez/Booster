class CreateSpecialities < ActiveRecord::Migration
  def self.up
    create_table :specialities do |t|
      t.string :name
      t.integer :account_id

      t.timestamps
    end
    
    add_index :specialities, :account_id
  end

  def self.down
    drop_table :specialities
  end
end
