class Review < ActiveRecord::Base

	validates :star, presence: true
	validates :comments, presence: true

	belongs_to :user
	belongs_to :workout
end
