module Api
    class SharesController < ApplicationController
      before_action :authenticate_user
      before_action :set_note, only: [:create]
      before_action :set_friend, only: [:create]
  
      def create
        @current_user = User.find_by(id: $current_user_id)
        share = @current_user.shares.build(shareable: @note, shared_with: @friend)
        if share.save
          render json: { status: 'YES!', message: 'Note shared', data: share }, status: :ok
        else
          render json: { status: 'error', message: 'Unable to share note', data: share.errors }, status: :unprocessable_entity
        end
      end
  
      def my_shared_notes
        @current_user = User.find_by(id: $current_user_id)
        @shared_notes = @current_user.shared_notes
        render json: @shared_notes
      end
  
      def notes_shared_with_me
        @current_user = User.find_by(id: $current_user_id)
        @shared_notes = Share.where(shared_with: @current_user).map(&:shareable)
        render json: @shared_notes
      end
  
      private
  
      def set_note
        @note = Note.find(params[:note_id])
      end
  
      def set_friend
        @friend = User.find(params[:friend_id])
      end
  end
end