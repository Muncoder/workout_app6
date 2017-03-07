class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :workouts
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'

  def full_name
  	first_name + " " + last_name
  end

  def is_friend(new_friend)
  	friendships.map(&:friend).include?(new_friend) || self == new_friend
  end

  def already_friendship?(friend)
  	friendships.where(friend: friend).first
  end

end