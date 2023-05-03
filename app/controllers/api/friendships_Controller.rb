module Api
    class FriendshipsController < ApplicationController
      before_action :authenticate_user
      before_action :set_friend, only: [:create, :destroy]
      protect_from_forgery with: :null_session

  
      def index
        @current_user = User.find_by(id: $current_user_id)
        @friends = @current_user.friends
        render json: @friends
      end
  
      def create
        @current_user = User.find_by(id: $current_user_id)
        friendship = @current_user.friendships.build(friend: @friend, status: 0)
        if friendship.nil?
            render json: { status: 'error', message: 'User not found', data: friendship}, status: :unprocessable_entity
        elsif friendship.save
          render json: { status: 'YES!', message: 'Friendship request sent', data: friendship }, status: :ok
        else
          render json: { status: 'error', message: 'Unable to send friendship request', data: friendship.errors }, status: :unprocessable_entity
        end
      end
  
      def update
        @current_user = User.find_by(id: $current_user_id)
        friendship = Friendship.find_by(user: @friend, friend: @current_user)
        if friendship.update(status: 'accepted')
          render json: { status: 'YES!', message: 'Friendship request accepted', data: friendship }, status: :ok
        else
          render json: { status: 'error', message: 'Unable to accept friendship request', data: friendship.errors }, status: :unprocessable_entity
        end
      end
  
      def destroy
        @current_user = User.find_by(id: $current_user_id)
        friendship = Friendship.find_by(user: @current_user, friend: @friend)
        if friendship.destroy
          render json: { status: 'YES!', message: 'Friend removed', data: friendship }, status: :ok
        else
          render json: { status: 'error', message: 'Unable to remove friend', data: friendship.errors }, status: :unprocessable_entity
        end
      end
  
      private
  
      def set_friend
        @friend = User.find(params[:friend_id])
      end
    end
  end
  