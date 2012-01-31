class CreateRoutes < ActiveRecord::Migration
  def self.up
    create_table :routes do |t|
      t.string :name
      t.string :description
      t.references :user
      t.date :start_date
      t.references :account

      t.timestamps
    end
    
    add_index :routes, :account_id
  end

  def self.down
    drop_table :routes
  end
end
