class UsersController < ApplicationController
    def feed_photos
        @public_photo = Photo.where(mode: :public_mode)
        if user_signed_in? 
            @user_photo = current_user.photos
            @photos = @user_photo + @public_photo
            @photos.uniq!
            if current_user.is_admin? 
                redirect_to photos_path
            end
        else
            @photos = @public_photo
            @photos = @photos.uniq
        end
    end
    def index
    end
    def edit
    end
end
