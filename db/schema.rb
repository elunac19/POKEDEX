ActiveRecord::Schema[7.1].define(version: 2023_10_26_214612) do
  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.float "height"
    t.float "weight"
    t.string "tipo"
    t.integer "hp"
    t.integer "attack"
    t.integer "defense"
    t.integer "special_attack"
    t.integer "special_defense"
    t.integer "velocity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
