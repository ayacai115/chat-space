class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :body_or_image, presence: true
  validates :group_id, presence: true
  validates :user_id, presence: true

  private
    def body_or_image
      body.presence or image.presence
    end
end
