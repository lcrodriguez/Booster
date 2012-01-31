class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
      t.references :speciality
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :hospital
      t.string :clinic
      t.string :street
      t.string :street_number
      t.references :city
      t.string :zip_code
      t.string :phone
      t.string :email
      t.string :secretary
      t.date :birth_date
      t.string :visit_days
      t.string :visit_hours
      t.references :account

      t.timestamps
    end
    
    add_index :doctors, :account_id
  end

  def self.down
    drop_table :doctors
  end
end
