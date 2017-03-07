class WorkoutsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	before_action :find_workout, only: [:show, :edit, :update, :destroy]

	def index
		@workouts = Workout.all
	end

	def new
		@workout = current_user.workouts.new
	end

	def create

		@workout = current_user.workouts.create(workout_params)

		if @workout.save
			flash[:notice] = "Saved successfully"
			redirect_to workouts_path
		else
			flash[:notice] = "Update successfully"
			redirect_to workouts_path
		end

	end

	def show

	end

	def save
	end

	def edit
	end

	def update
		if @workout.update(workout_params)
			flash[:notice] = "Updated successfully"
			redirect_to workouts_path
		else
			flash[:notice] = "Could not be updated"
			render "edit"
		end

	end

	def destroy
		@workout.delete
		flash[:notice] = "Deleted successfully"
		redirect_to workouts_path
	end

	private
		def workout_params
			params.require(:workout).permit(:title, :description, :workout_date, :duration_in_min)
		end

		def find_workout
			@workout = Workout.find(params[:id])
		end

end