class AddQuantityRequestToVisitDetail < ActiveRecord::Migration
  def self.up
    add_column :visitdetails, :quantityrequested, :integer
  end

  def self.down
    remove_column :visitdetails, :quantityrequested
  end
end
