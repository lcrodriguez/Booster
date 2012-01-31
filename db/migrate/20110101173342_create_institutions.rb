class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string :name
      t.references :account

      t.timestamps
    end
    
    add_index :institutions, :account_id
  end

  def self.down
    drop_table :institutions
  end
end
