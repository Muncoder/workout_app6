class Workout < ActiveRecord::Base

	has_many :reviews

	default_scope { where('workout_date > ?', 7.days.ago).order(workout_date: :desc)}

	def has_reviews(user)
		reviews.map(&:user_id).include?(user.id)
	end

	def review_average
		reviews.count == 0 ? "" : reviews.average(:star).round(2) 
	end
end