class CreateBatteries < ActiveRecord::Migration[6.0]
  def change
    create_table :batteries do |t|
      t.string "name"
      t.string "brand"
      t.integer "voltage", default: 0
      t.integer "life_cycle", default: 0
      t.timestamps null: false
    end
  end
end
