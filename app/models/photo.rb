class Photo < ApplicationRecord
  belongs_to :user
  
  enum mode: [:private_mode, :public_mode]
  mount_uploader :image, ImageUploader

  
  validates :title, :description, :mode, :image, presence: true
  validates :title, length: { maximum: CONSTANTS::Photo::MAX_LENGTH_TITLE }
  validates :description, length: { maximum: CONSTANTS::Photo::MAX_LENGTH_DESCRIPTION }
  validates :mode, inclusion: {in: [ "private_mode", "public_mode"]}
end
