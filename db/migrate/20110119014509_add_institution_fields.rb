class AddInstitutionFields < ActiveRecord::Migration
  def self.up
    add_column :institutions, :user_id, :integer
    add_column :institutions, :contact, :string
    add_column :institutions, :street, :string
    add_column :institutions, :street_number, :string
    add_column :institutions, :city_id, :integer
    add_column :institutions, :state_id, :integer
    add_column :institutions, :zip_code, :string
    add_column :institutions, :phone, :string
    add_column :institutions, :email, :string
    add_column :institutions, :type, :string
    add_column :institutions, :comments, :string
  end

  def self.down
    remove_column :institutions, :user_id
    remove_column :institutions, :contact
    remove_column :institutions, :street
    remove_column :institutions, :street_number
    remove_column :institutions, :city_id
    remove_column :institutions, :state_id
    remove_column :institutions, :zip_code
    remove_column :institutions, :phone
    remove_column :institutions, :email
    remove_column :institutions, :type
    remove_column :institutions, :comments
  end
end
