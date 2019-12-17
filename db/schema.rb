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

ActiveRecord::Schema.define(version: 2019_12_17_000415) do

  create_table "arcives", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calenders", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo1"
    t.string "photo2"
    t.string "photo3"
    t.string "photo4"
    t.string "photo5"
    t.string "photo6"
    t.string "photo7"
    t.string "photo8"
    t.string "photo9"
    t.string "photo10"
    t.string "data1"
    t.string "data2"
    t.string "data3"
    t.string "data4"
    t.string "data5"
    t.string "data6"
    t.string "data7"
    t.string "data8"
    t.string "data9"
    t.string "data10"
    t.string "datetime"
    t.string "nation"
  end

  create_table "satelights", force: :cascade do |t|
    t.string "name1"
    t.string "name2"
    t.string "name3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
