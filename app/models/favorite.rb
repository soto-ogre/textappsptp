class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :memo

  def like(memo)
    favotites.find_or_create_by(memo_id: memo.id)
  end

  def unlike
    favorite = favorites.find_by(memo_id: memo.id)
    favorite.destroy if favorite
  end
end
