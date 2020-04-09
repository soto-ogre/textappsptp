class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :delivery_day ,null: false
      t.string :delivery_status,null: false
      t.string :delivery_method,null: false
      t.integer :postage,null: false
      t.string :postage_bearer,null: false
      t.references :apple,foreign_key: true
      t.string :delivery_area,null: false

      t.timestamps
    end
  end
end
