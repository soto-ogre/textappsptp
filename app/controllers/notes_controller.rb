class NotesController < ApplicationController
  def index
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note
    @note.save
    redirect_to new_user_path
    end
  end

  def show
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
