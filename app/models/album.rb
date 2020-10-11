class Album < ApplicationRecord
  belongs_to :user

  enum mode: [:private_mode, :public_mode]

end
