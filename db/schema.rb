# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_09_141454) do

  create_table "cubic_puzzle_stages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "floors"
    t.string "levels"
    t.string "objects"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "stage_no", default: 0, null: false
  end

  create_table "fairy_puzzle_original_stages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "field"
    t.integer "mp"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "floating_puzzle_stages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "author"
    t.string "stage_name"
    t.string "map_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "neondrome_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "player_id"
    t.string "name"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "twinkle_hopper_information", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.float "position_x"
    t.float "position_y"
    t.float "position_z"
    t.float "rotation_w"
    t.float "rotation_x"
    t.float "rotation_y"
    t.float "rotation_z"
    t.float "velocity_x"
    t.float "velocity_y"
    t.float "angular_velocity"
    t.integer "time_count"
    t.integer "jump_count"
    t.bigint "player_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_twinkle_hopper_information_on_player_id"
  end

  create_table "twinkle_hopper_players", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "player_token"
    t.string "player_name"
    t.float "hopper_color_hue"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "twinkle_hopper_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "player_id"
    t.string "player_name"
    t.integer "clear_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unity1week17ths", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "hash"
    t.string "name"
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "unityroom_typing_records", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "player_id"
    t.string "player_name"
    t.integer "time_count"
    t.integer "type_count"
    t.integer "miss_count"
    t.integer "typing_speed"
    t.integer "accuracy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "twinkle_hopper_information", "twinkle_hopper_players", column: "player_id"
end
