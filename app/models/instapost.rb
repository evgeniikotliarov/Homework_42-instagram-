class Instapost < ApplicationRecord
	belongs_to :user

	validates :content, presence: true, length: {maximum: 140}

	has_attached_file :image, styles:{medium: '250 x 250>', thumb: '100 x 100>'},
			default_url: 'image/:style/missing.png'
	validates_attachment_content_type :image,
			content_type: ['image/jpeg', 'image/gif', 'image/png']

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

end
