class ChangeApplesTable < ActiveRecord::Migration[5.2]
  def change
    add_column    :apples, :name, :string
    add_column    :apples, :discription, :text
    add_column    :apples, :price, :integer
    add_column    :apples, :size, :integer
    add_column    :apples, :status, :string
    add_column    :apples, :pictures, :string
    add_column    :apples, :condition, :integer
    remove_column :apples, :title, :string
    remove_column :apples, :images, :string
    remove_column :apples, :text, :text
  end
end
