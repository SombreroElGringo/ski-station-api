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

ActiveRecord::Schema.define(version: 2019_01_25_204502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "description"
    t.string "state"
    t.string "altitude"
    t.string "opening"
    t.string "partial_opening"
    t.integer "snowpark"
    t.text "styles"
    t.text "contact"
    t.text "domains"
    t.text "snowfall"
    t.text "open_domains"
    t.text "ski_pass"
    t.text "weather"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
