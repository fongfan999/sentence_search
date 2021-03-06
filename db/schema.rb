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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_16_142956) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "vocabulary_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "sent_at"
    t.integer "vocabulary_sense_index", default: 0
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
    t.index ["vocabulary_id"], name: "index_subscriptions_on_vocabulary_id"
  end

  create_table "subtitle_sources", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subtitles", force: :cascade do |t|
    t.text "english"
    t.text "vietnamese"
    t.bigint "subtitle_source_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subtitle_source_id"], name: "index_subtitles_on_subtitle_source_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "messenger_uid"
    t.integer "words_of_the_day", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_read_vocabulary_at"
    t.index ["messenger_uid"], name: "index_users_on_messenger_uid"
  end

  create_table "vocabularies", force: :cascade do |t|
    t.string "word"
    t.string "word_class"
    t.jsonb "sense", default: "{}", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ipa"
    t.string "pronunciation_url"
    t.string "original_word"
    t.index ["word"], name: "index_vocabularies_on_word"
  end

  add_foreign_key "subscriptions", "users"
  add_foreign_key "subscriptions", "vocabularies"
  add_foreign_key "subtitles", "subtitle_sources"
end
