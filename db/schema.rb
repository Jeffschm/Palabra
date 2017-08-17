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

ActiveRecord::Schema.define(:version => 20150715054218) do

  create_table "goals", :force => true do |t|
    t.string   "name"
    t.string   "title_nl"
    t.string   "title_en"
    t.string   "title_es"
    t.string   "title_pap"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "goals_words", :id => false, :force => true do |t|
    t.integer "goal_id"
    t.integer "word_id"
  end

  create_table "inline_forms_keys", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "inline_forms_locales", :force => true do |t|
    t.string   "name"
    t.integer  "inline_forms_translations_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "inline_forms_translations", :force => true do |t|
    t.integer  "inline_forms_key_id"
    t.integer  "inline_forms_locale_id"
    t.text     "value"
    t.text     "interpolations"
    t.boolean  "is_proc"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "name"
    t.string   "caption"
    t.string   "image"
    t.text     "description"
    t.integer  "word_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "translations", :id => false, :force => true do |t|
    t.string  "locale"
    t.string  "thekey"
    t.text    "value"
    t.text    "interpolations"
    t.boolean "is_proc"
  end

  create_table "users", :force => true do |t|
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
    t.string   "name"
    t.string   "locale"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

  create_table "words", :force => true do |t|
    t.string   "name"
    t.integer  "source_id"
    t.integer  "attested"
    t.date     "attested_on"
    t.integer  "countable",   :limit => 2
    t.integer  "user_id"
    t.text     "description"
    t.string   "tr_nl"
    t.string   "tr_en"
    t.string   "tr_es"
    t.string   "tr_pap_cw"
    t.string   "tr_pap_aw"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "status2",     :limit => 2
    t.integer  "goal_id"
    t.integer  "wordtype_id"
    t.string   "tags"
    t.string   "picture_url"
    t.string   "youtube_url"
    t.string   "latin"
  end

  create_table "words_wordtypes", :id => false, :force => true do |t|
    t.integer "word_id"
    t.integer "wordtype_id"
  end

  create_table "wordtypes", :force => true do |t|
    t.string   "name"
    t.string   "title_nl"
    t.string   "title_en"
    t.string   "title_es"
    t.string   "title_pap"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
