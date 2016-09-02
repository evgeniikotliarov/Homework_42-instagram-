class Instapost < ApplicationRecord
	belongs_to :user

	validates :content, presence: true, length: {maximum: 140}

	has_attached_file :image, styles:{medium: '250 x 250>', thumb: '100 x 100>'},
			default_url: 'image/:style/missing.png'
	validates_attachment_content_type :image,
			content_type: ['image/jpeg', 'image/gif', 'image/png']

end
