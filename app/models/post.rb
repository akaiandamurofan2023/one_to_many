class Post < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :favorites, dependent: :destroy
	mount_uploader :image, ImageUploader
    def favorited_by? user
        favorites.where(user_id: user.id).exists?
    end
    validates :body, presence: true
    validates :title, presence: true
end
