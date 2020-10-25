class Album < ApplicationRecord
  belongs_to :user

  enum mode: [:private_mode, :public_mode]
  mount_uploaders :images, ImageUploader

  validates :title, :description, :mode, :images, presence: true
  validates :title, length: { maximum: CONSTANTS::Album::MAX_LENGTH_TITLE }
  validates :description, length: { maximum: CONSTANTS::Album::MAX_LENGTH_DESCRIPTION }
  validates :mode, inclusion: {in: [ "private_mode", "public_mode"]}

end
