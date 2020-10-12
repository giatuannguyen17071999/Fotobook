class Album < ApplicationRecord
  belongs_to :user

  enum mode: [:private_mode, :public_mode]
  mount_uploaders :images, ImageUploader

  validates :title, :description, :mode, :images, presence: true
  validates :title, length: { maximum: 140 }
  validates :description, length: { maximum: 300 }
  validates :mode, inclusion: {in: [ "private_mode", "public_mode"]}

end
