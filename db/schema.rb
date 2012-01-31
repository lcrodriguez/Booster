# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110122172902) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "subdomain"
    t.string   "owner_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.integer  "state_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["account_id"], :name => "index_cities_on_account_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["account_id"], :name => "index_customers_on_account_id"

  create_table "doctors", :force => true do |t|
    t.integer  "speciality_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "hospital"
    t.string   "clinic"
    t.string   "street"
    t.string   "street_number"
    t.integer  "city_id"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "email"
    t.string   "secretary"
    t.date     "birth_date"
    t.string   "visit_days"
    t.string   "visit_hours"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comments"
    t.integer  "state_id"
  end

  add_index "doctors", ["account_id"], :name => "index_doctors_on_account_id"

  create_table "expenses", :force => true do |t|
    t.string   "description"
    t.integer  "route_id"
    t.decimal  "amount"
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expenses", ["account_id"], :name => "index_expenses_on_account_id"

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "contact"
    t.string   "street"
    t.string   "street_number"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "zip_code"
    t.string   "phone"
    t.string   "email"
    t.string   "type"
    t.string   "comments"
  end

  add_index "institutions", ["account_id"], :name => "index_institutions_on_account_id"

  create_table "material_categories", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "material_categories", ["account_id"], :name => "index_material_categories_on_account_id"

  create_table "materials", :force => true do |t|
    t.string   "name"
    t.integer  "material_category_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.string   "description"
  end

  add_index "materials", ["account_id"], :name => "index_materials_on_account_id"

  create_table "request_items", :force => true do |t|
    t.integer  "request_id"
    t.integer  "material_id"
    t.integer  "quantity"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "request_items", ["account_id"], :name => "index_request_items_on_account_id"

  create_table "requests", :force => true do |t|
    t.string   "name"
    t.integer  "customer_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.integer  "user_id"
    t.string   "description"
  end

  add_index "requests", ["account_id"], :name => "index_requests_on_account_id"

  create_table "route_lines", :force => true do |t|
    t.integer  "doctor_id"
    t.integer  "institution_id"
    t.string   "comments"
    t.integer  "sortorder"
    t.integer  "route_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
    t.integer  "state_id"
  end

  add_index "route_lines", ["account_id"], :name => "index_route_lines_on_account_id"

  create_table "routes", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.date     "start_date"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "routes", ["account_id"], :name => "index_routes_on_account_id"

  create_table "specialities", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "specialities", ["account_id"], :name => "index_specialities_on_account_id"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["account_id"], :name => "index_states_on_account_id"

  create_table "user_types", :force => true do |t|
    t.string   "name"
    t.boolean  "is_admin"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_types", ["account_id"], :name => "index_user_types_on_account_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.integer  "usertype_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "user_type_id"
  end

  add_index "users", ["account_id"], :name => "index_users_on_account_id"

  create_table "visitdetails", :force => true do |t|
    t.integer  "visit_id"
    t.integer  "material_id"
    t.string   "description"
    t.integer  "account_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantityrequested"
  end

  add_index "visitdetails", ["account_id"], :name => "index_visitdetails_on_account_id"

  create_table "visits", :force => true do |t|
    t.integer  "user_id"
    t.integer  "request_id"
    t.date     "visiton"
    t.integer  "doctor_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["account_id"], :name => "index_visits_on_account_id"

end
