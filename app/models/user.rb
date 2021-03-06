class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :instaposts, dependent: :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  
  has_many :followed_users, through: :relationships, source: :followed


  has_many :reverse_relationships, foreign_key: "follower_id",
  							class_name: "Relationship",
						    dependent: :destroy

  has_many :followers, through: :reverse_relationships, source: :follower 

  # has_many :followed_users, through: :relationships, source: :followed

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: {maximum: 50}


  def following?(other_user)
  	relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
  	relationships.create!(followed_id: other_user.id) 	
  end

  def unfollow!(other_user)
  	relationships.find_by(followed_id: other_user.id).destroy!
  end

  def feed
    Instapost.from_users_followed_by(self)
  end

  
end
