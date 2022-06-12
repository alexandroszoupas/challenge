class CreateBatteriesDeleteComment < ActiveRecord::Migration[6.0]
  def change
    add_column :batteries, :deletion_comment, :string
  end
end
