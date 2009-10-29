# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091029161717) do

  create_table "accounts", :force => true do |t|
    t.string   "identity_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts_comics", :id => false, :force => true do |t|
    t.integer  "account_id"
    t.integer  "comic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comics", :force => true do |t|
    t.string   "feed_url"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_name"
    t.string   "site_url"
  end

  create_table "open_id_authentication_associations", :force => true do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string  "handle"
    t.string  "assoc_type"
    t.binary  "server_url"
    t.binary  "secret"
  end

  create_table "open_id_authentication_nonces", :force => true do |t|
    t.integer "timestamp",  :null => false
    t.string  "server_url"
    t.string  "salt",       :null => false
  end

  create_table "strips", :force => true do |t|
    t.text     "description", :limit => 255
    t.date     "posted_on"
    t.string   "image_url"
    t.integer  "comic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extra"
    t.string   "permalink"
  end

end
