class CreateApples < ActiveRecord::Migration[5.2]
  def change
    create_table :apples do |t|
      t.string :title
      t.string :images
      t.text :text
      t.integer :user_id

      t.timestamps
    end
  end
end
