class Template < ActiveRecord::Base
  belongs_to :user
  mount_uploader :attachment, AttachmentUploader
  mount_uploader :image, ImageUploader
  validates :name, presence: true
  validates :description, presence: true
end
