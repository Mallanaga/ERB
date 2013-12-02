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

ActiveRecord::Schema.define(:version => 20131202190134) do

  create_table "boxes", :force => true do |t|
    t.integer  "company_id"
    t.string   "uid"
    t.decimal  "length"
    t.decimal  "width"
    t.decimal  "height"
    t.decimal  "weight"
    t.decimal  "cost",       :precision => 6, :scale => 2
    t.decimal  "cb_cost",    :precision => 6, :scale => 2
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.integer  "frequency"
    t.boolean  "active"
    t.integer  "multiplier",                               :default => 1
  end

  add_index "boxes", ["company_id"], :name => "index_boxes_on_company_id"
  add_index "boxes", ["uid"], :name => "index_boxes_on_uid", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "postal_code"
    t.string   "website"
    t.text     "about"
    t.text     "testimonial"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "companies", ["slug"], :name => "index_companies_on_slug"

  create_table "feeds", :force => true do |t|
    t.string   "url"
    t.string   "feed_url"
    t.string   "title"
    t.string   "etag"
    t.string   "last_modified"
    t.string   "newest_entry_url"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "mailings", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_details", :force => true do |t|
    t.integer  "order_id"
    t.integer  "box_id"
    t.integer  "quantity"
    t.decimal  "box_price",  :precision => 8, :scale => 2
    t.decimal  "cb_price",   :precision => 8, :scale => 2
    t.decimal  "mould_fees", :precision => 8, :scale => 2
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "company_id"
    t.date     "ordered_on"
    t.date     "delivered_on"
    t.boolean  "paid"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "invoice"
    t.decimal  "tax"
  end

  create_table "posts", :force => true do |t|
    t.integer  "feed_id"
    t.integer  "user_id"
    t.string   "title"
    t.string   "author"
    t.string   "url"
    t.text     "summary"
    t.text     "content"
    t.string   "guid"
    t.datetime "published_at"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "slug"
  end

  add_index "posts", ["published_at"], :name => "index_posts_on_published_at"
  add_index "posts", ["slug"], :name => "index_posts_on_slug"

  create_table "tags", :force => true do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "trips", :force => true do |t|
    t.integer  "box_id"
    t.date     "month"
    t.integer  "quantity"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "retired",    :default => 0
  end

  create_table "users", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                  :default => false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
