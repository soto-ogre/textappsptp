class AddPictureToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests,:pictures,:string
  end
end
