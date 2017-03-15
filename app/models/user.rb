class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :workouts
  has_many :friendships
  has_many :friends, through: :friendships, class_name: 'User'
  has_many :reviews

  def full_name
  	first_name + " " + last_name
  end

  def is_friend(new_friend)
  	friendships.map(&:friend).include?(new_friend) || self == new_friend
  end

  def already_friendship?(friend)
  	friendships.where(friend: friend).first
  end

  def self.facebook_sign(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider,
        user.uid = auth.uid,
        user.email = auth.info.email,
        user.password = Devise::friendly_token[0,20],
        user.first_name = auth.info.first_name,
        user.last_name = auth.info.last_name,
        user.description = auth.info.description,
        user.image = auth.info.image
      end
    end
  end

end