class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.references :user
      t.references :request
      t.date :visiton
      t.references :doctor
      t.integer :account_id

      t.timestamps
    end
    
    add_index :visits, :account_id
  end

  def self.down
    drop_table :visits
  end
end
