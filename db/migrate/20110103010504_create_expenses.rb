class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.string :description
      t.references :route
      t.decimal :amount
      t.references :user
      t.references :account

      t.timestamps
    end
    
    add_index :expenses, :account_id
  end

  def self.down
    drop_table :expenses
  end
end
