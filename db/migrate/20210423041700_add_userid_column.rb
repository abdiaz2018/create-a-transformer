class AddUseridColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :transformers, :user_id, :integer
  end
end
