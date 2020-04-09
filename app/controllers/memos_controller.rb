class MemosController < ApplicationController
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  include MarkdownHelper
  include MemoHelper


  def index
    @memos = current_user.memos.all
    
    @categories = Category.all

    if params[:tag]
      @memos = Memo.tagged_with(params[:tag])
    else
      @memos
    end

    if params[:tag_name]
      @memos = @memos.tagged_with("#{params[:tag_name]}")
    end

  end


  def show
    @categories = Category.all
    case @memo.category_id
    when 1 then
      @content = markdown(@memo.content)
    when 2 then
      @memo.file_existence
      
      crdfile_find

    end

    @memo.group_id = 1
    @memo.save

  end

  def new
    @memos = Memo.all
    @memo = Memo.new
    @categories = Category.all
    @str = params[:str]

  end

  def edit
    @memos = Memo.all
    @categories = Category.all
  end

  def create
    @memo = Memo.new(memo_params)
    @categories = Category.all
    respond_to do |format|
      if @memo.save
        @memo.switch_for_each_category
        format.html { redirect_to @memo, notice: 'Memo was successfully created.' }
        format.json { render :show, status: :created, location: @memo }
      else
        format.html { render :new }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end


  end

  def update
    @categories = Category.all
    respond_to do |format|
      if @memo.update(memo_params)
        @memo.switch_for_each_category
        format.html { redirect_to @memo, notice: 'Memo was successfully updated.' }
        format.json { render :show, status: :ok, location: @memo }
      else
        format.html { render :edit }
        format.json { render json: @memo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @categories = Category.all
    @memo.destroy
    @memo.delete_switch_for_each_category
    respond_to do |format|
      format.html { redirect_to memos_url, notice: 'Memo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @memos = current_user.memos.search(params[:search])
    @count = @memos.count

    # @memos = Memo.all
    
    # @count = @memos.count
    if params[:tag_name]
      @memos = @memos.tagged_with("#{params[:tag_name]}")
    end

  end

 




  

  private
    def set_memo
      @memo = Memo.find(params[:id])
    end

    def memo_params
      params.require(:memo).permit(:title, :content, :category_id, :label_list).merge(user_id: current_user.id)
    end

    def set_category
      @category = Category.find(params[:category_id])
      @memo = @category.memos.build
    end

    def tag_params
      params.require(:entry).permit(:tag_list)
    end


end
