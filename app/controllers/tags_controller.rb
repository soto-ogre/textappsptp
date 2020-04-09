class TagsController < ApplicationController

  def index
    @memos = current_user.memos.all
    @memo = Memo.new
    @count = @memos.count
    if params[:tag_name]
      @memos = @memos.tagged_with("#{params[:tag_name]}")
    end
  end

  def show
    render layout: false
    @memos = current_user.memos.all
    @memo = Memo.new
    @count = @memos.count
    if params[:tag_name]
      @memos = @memos.tagged_with("#{params[:tag_name]}")
    end
  end

  def tag_params
    params.require(:entry).permit(:tag_list,:id)
  end

end
