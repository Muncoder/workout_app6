class Workout < ActiveRecord::Base

	belongs_to :workout

	default_scope { where('workout_date > ?', 7.days.ago).order(workout_date: :desc)}
end