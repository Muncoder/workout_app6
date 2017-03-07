class FriendshipsController < ApplicationController


	def create
		Friendship.create(friendship_params.merge!(user_id: current_user.id, friend_id: params[:friend_id]))
		redirect_to :back
	end

	def destroy
		@friendship = Friendship.find(params[:id])

		if @friendship.delete
			flash[:notice] = "Unfriended successfully"
			redirect_to :back
		end
	end

	private

	def friendship_params
		params.permit(:user_id, :friend_id)
	end

end