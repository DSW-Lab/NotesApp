module Api
  class NotesController < ApplicationController

    before_action :set_user
    before_action :set_note, only: [:show, :edit, :update, :destroy]
    protect_from_forgery with: :null_session

    # before_action :authorized
    # skip_before_action :verify_authenticity_token

    # GET /notes    
    def index
      @notes = Note.where(user_id: @user.id)
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
    
      def current_user
        @current_user = User.find_by(id: $current_user_id)
      end

      
      # POST /notes
      def create
        @note = current_user.notes.build(note_params)
        if @note.save
          render json: {
            status: 'YES!',
            message: 'Nota creada',
            data: @note
          }, status: :ok        
        else
          render json: {
          status: 'error',
          message: 'Error al crear la nota',
          data: @note.errors
          }, status: :unprocessable_entity     
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
      
      def set_user
        @user = User.find_by(id: $current_user_id)
      end
  
      def note_params
        params.require(:note).permit(:title, :content, :is_shared)
      end
  end
end
    

    