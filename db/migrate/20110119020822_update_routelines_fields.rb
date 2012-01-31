class UpdateRoutelinesFields < ActiveRecord::Migration
  def self.up
    add_column :route_lines, :city_id, :integer
    add_column :route_lines, :state_id, :integer
  end

  def self.down
    remove_column :route_lines, :doctor_id
    remove_column :route_lines, :institution_id
  end
end
