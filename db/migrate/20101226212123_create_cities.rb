class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.string :name
      t.references :state
      t.integer :account_id

      t.timestamps
    end
    
    add_index :cities, :account_id
  end

  def self.down
    drop_table :cities
  end
end
