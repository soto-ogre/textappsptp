class AddColumnToBuyer < ActiveRecord::Migration[5.2]
  def change
      add_reference :apples,:buyer, foreign_key: { to_table: :users }
      add_reference :apples,:seller, foreign_key: { to_table: :users }
      remove_column :apples,:user_id, :integer
  end
end
