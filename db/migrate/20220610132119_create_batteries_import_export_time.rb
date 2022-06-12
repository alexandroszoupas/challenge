class CreateBatteriesImportExportTime < ActiveRecord::Migration[6.0]
  def change
    add_column :batteries, :imported_at, :integer
    add_column :batteries, :exported_at, :integer
  end
end
