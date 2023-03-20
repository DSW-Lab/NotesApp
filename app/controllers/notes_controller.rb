class NotesController < ApplicationController

before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def edit
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      render json: { status: 'YES!', message: 'Note was successfully created.', data: @note }, status: :ok
    else
      render json: { status: 'error', message: 'Note not created', data: @note.errors }, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])

      if @note.update(user_params)
        render json: { status: 'YES!', message: 'Note was successfully updated.', data: @note }, status: :ok
      else
        render json: { status: 'error', message: 'Note not updated', data: @note.errors }, status: :unprocessable_entity
      end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content, :user_id, :shared, :created_at)
    end


end

