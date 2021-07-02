# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_02_221212) do

  create_table "card_formats", force: :cascade do |t|
    t.integer "card_id"
    t.integer "format_id"
    t.boolean "legality", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_formats_on_card_id"
    t.index ["format_id"], name: "index_card_formats_on_format_id"
  end

  create_table "card_mtg_sets", force: :cascade do |t|
    t.integer "card_id", null: false
    t.integer "mtg_set_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_card_mtg_sets_on_card_id"
    t.index ["mtg_set_id"], name: "index_card_mtg_sets_on_mtg_set_id"
  end

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "text"
    t.integer "power"
    t.integer "toughness"
    t.integer "cmc"
    t.string "rarity"
    t.string "card_type"
    t.string "artist"
    t.string "colors"
    t.string "set"
    t.string "flavor"
    t.string "mana_cost"
    t.string "image_url"
    t.integer "loyalty"
    t.integer "multiverse_id"
    t.integer "mtg_set_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mtg_set_id"], name: "index_cards_on_mtg_set_id"
  end

  create_table "deck_cards", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "card_id"
    t.integer "card_quantity", default: 1
    t.boolean "sideboard", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["card_id"], name: "index_deck_cards_on_card_id"
    t.index ["deck_id"], name: "index_deck_cards_on_deck_id"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.string "creator"
    t.integer "format_id"
    t.integer "user_id"
    t.integer "mainboard"
    t.integer "sideboard"
    t.integer "total_cards"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["format_id"], name: "index_decks_on_format_id"
    t.index ["user_id"], name: "index_decks_on_user_id"
  end

  create_table "formats", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mtg_sets", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.date "release_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "card_formats", "cards"
  add_foreign_key "card_formats", "formats"
  add_foreign_key "card_mtg_sets", "cards"
  add_foreign_key "card_mtg_sets", "mtg_sets"
end
