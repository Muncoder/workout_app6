class DashboardsController < ApplicationController

	def members
		@members = User.all.order("created_at DESC")
	end

	def my_dashboard
		@workouts = current_user.workouts
		@my_friends = current_user.friends
	end

	def user_dashboard
		@user = User.find(params[:user_id])
		@workouts = @user.workouts
		@my_friends = @user.friends
	end

end