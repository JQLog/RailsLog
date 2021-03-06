# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20130131181857) do

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "supplier_id"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "rut"
    t.string   "contact"
    t.integer  "supplier_id"
  end

  add_index "clients", ["supplier_id"], :name => "index_clients_on_supplier_id"

  create_table "orders", :force => true do |t|
    t.text     "notes"
    t.datetime "due_date"
    t.decimal  "total"
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "supplier_id"
    t.string   "delivery_address"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.integer  "number"
    t.string   "final_client"
    t.string   "status",           :default => "Pending"
    t.boolean  "pay",              :default => false
    t.boolean  "active",           :default => true
    t.integer  "invoice_number"
    t.integer  "admin_id"
  end

  add_index "orders", ["client_id"], :name => "index_orders_on_client_id"
  add_index "orders", ["number"], :name => "index_orders_on_number"
  add_index "orders", ["supplier_id"], :name => "index_orders_on_supplier_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "supplier_id"
    t.decimal  "tax"
  end

  add_index "products", ["supplier_id"], :name => "index_products_on_supplier_id"

  create_table "products_orders", :force => true do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.decimal "price"
  end

  create_table "purchases", :force => true do |t|
    t.integer  "admin_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "rut"
    t.string   "contact_person"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "last_order_number", :default => 0
  end

  create_table "transactions", :force => true do |t|
    t.integer  "purchase_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count"
    t.date     "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "supplier_id"
    t.boolean  "is_admin"
  end

end
