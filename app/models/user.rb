class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :first_name, :last_name, presence: true
  # validates :first_name, :last_name, length: { maximum: 25 }
  # validates :email, length: { maximum: 255 }
  # validates :email, uniqueness: true
  # validates :password, length: { maximum: 64 }

end
