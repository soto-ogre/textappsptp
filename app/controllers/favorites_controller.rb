class FavoritesController < ApplicationController
  before_action :set_board, only: %i[create destroy]
  include FavoriteHelper

  def show
    @memos = current_user.memos.all
    @count = @memos.count
    if params[:tag_name]
      @memos = @memos.tagged_with("#{params[:tag_name]}")
    end
    @favorite = current_user.favorites.where(params[:id])
    @liked_post = Memo.joins(:favorite).where(favorites: { user: @user })
  end

  def create
    user=current_user
    memo=Memo.find(params[:memo_id])
    Favorite.find_or_create_by(user_id: user.id,memo_id:memo.id)

  end

  def destroy
    user=current_user
    memo=Memo.find(params[:memo_id])
    favorite=Favorite.find_by(user_id: user.id,memo_id:memo.id)
    favorite.delete
  end

  private

  def set_board
    @memo = Memo.find(params[:memo_id])
  end

end

