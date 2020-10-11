class Photo < ApplicationRecord
  belongs_to :user
  
  enum mode: [:private_mode, :public_mode]
  mount_uploader :image, ImageUploader

  
  validates :title, :description, :mode, :image, presence: true
  validates :title, length: { maximum: 140 }
  validates :description, length: { maximum: 300 }
  validates :mode, inclusion: {in: [:public_mode, :private_mode]}
end
