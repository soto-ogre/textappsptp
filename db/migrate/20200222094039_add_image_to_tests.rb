class AddImageToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :images, :string
    remove_column :tests, :pictures, :string
  end



end
