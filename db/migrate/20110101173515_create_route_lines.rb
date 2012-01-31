class CreateRouteLines < ActiveRecord::Migration
  def self.up
    create_table :route_lines do |t|
      t.references :doctor
      t.references :institution
      t.string :comments
      t.integer :sortorder
      t.references :route
      t.references :account

      t.timestamps
    end
    
    add_index :route_lines, :account_id
  end

  def self.down
    drop_table :route_lines
  end
end
