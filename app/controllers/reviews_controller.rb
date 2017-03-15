class ReviewsController < ApplicationController

	def create
		@review = Review.create(review_params)

		if @review.save
			flash[:notice] = "Review saved successfully"
			redirect_to @review.workout
		else
			flash[:notice] = "Review could not be saved"
			redirect_to :back
		end			
	end

	def destroy
		@review = Review.find(params[:id])

		if @review.delete
			flash[:notice] = "Review deleted successfully"
			redirect_to @review.workout
		else
			flash[:notice] = "Review could not be saved"
			redirect_to :back
		end			
	end

	private

		def review_params
			params.require(:review).permit(:user_id, :workout_id, :star, :comments)
		end

end