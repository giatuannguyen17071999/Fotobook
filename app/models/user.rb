class User < ApplicationRecord
  has_many :albums, dependent: :destroy, validate: true
  has_many :photos, dependent: :destroy, validate: true
  
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum status: [:inactive, :active]

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { maximum: CONSTANTS::User::MAX_LENGTH_NAME }
  validates :email, length: { maximum: CONSTANTS::User::MAX_LENGTH_EMAIL }
  validates :email, uniqueness: true
  validates :password, length: { maximum: CONSTANTS::User::MAX_LENGTH_PASS }

end
