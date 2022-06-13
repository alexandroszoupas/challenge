class CreateBatteries < ActiveRecord::Migration[6.0]
  def change
    create_table :batteries do |t|
      t.string "size"
      t.string "brand"
      t.float "voltage", default: 0
      t.integer "life_cycle", default: 0
      t.integer "count"
      t.datetime "deleted"
      t.string "deletion_comment"
      t.timestamps null: false
    end
  end
end
