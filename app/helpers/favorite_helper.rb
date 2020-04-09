module FavoriteHelper
  def favorite_mark
    case @memo.category.id
    when 1 then
      '<i class="fab fa-markdown fa-2x"></i>'
    when 2 then
      '<i class="fas fa-music fa-2x"></i>'
    end
  end
end
