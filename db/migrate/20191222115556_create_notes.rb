class CreateNotes < ActiveRecord::Migration[5.2]
  def change


    create_table :memos do |t|
      t.string      :title
      t.text      :content
      t.string      :image
      t.references      :category,  index: { name: 'category_index' }
      t.references      :group,     index: { name: 'group_index' }
      t.references   :user,index: { name: 'user' }

      t.timestamps
    end

  end
end
