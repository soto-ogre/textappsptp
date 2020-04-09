class AddRefToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference  :tests, :user,index: { name: 'user' }
  end
end
