class CreateVisitdetails < ActiveRecord::Migration
  def self.up
    create_table :visitdetails do |t|
      t.references :visit
      t.references :material
      t.string :description
      t.integer :account_id
      t.integer :quantity

      t.timestamps
    end
    
    add_index :visitdetails, :account_id
  end

  def self.down
    drop_table :visitdetails
  end
end
