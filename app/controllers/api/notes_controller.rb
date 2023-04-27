module Api
  class NotesController < ApplicationController

    before_action :set_note, only: [:show, :edit, :update, :destroy]
    before_action :authorized
    skip_before_action :verify_authenticity_token

      # GET /notes    
      def index
        #@notes = Note.all
        # Solo queremos ver las de ese usuario
        @notes = Note.where user: @user.id
        render json: @notes
      end
    
      # GET /notes/1
      def show
        render json: @note
      end
    
      def new
        @note = Note.new
      end
    
      def edit
      end
    
      # POST /notes
      def create
        @note = Note.new(note_params)
        @note.user_id = @user
    
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
        @note = Note.find(params[:id])
        @note.destroy
        head :no_content
        #@note.destroy
        #respond_to do |format|
        #  format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
        #  format.json { head :no_content }
        #end
      end
    
      private
        def set_note
          @note = Note.find(params[:id])
        end
    
        def note_params
          params.require(:note).permit(:title, :content, :user_id, :shared, :created_at)
        end
    
    
  end

end
    

    