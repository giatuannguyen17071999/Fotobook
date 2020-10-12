class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
    before_action :set_item_per_page, only: [:feed_albums, :feed_photos]
    def feed_photos
        @public_photo = Photo.where(mode: :public_mode)
        if user_signed_in? 
            if current_user.is_admin? 
                redirect_to photos_path
            end
            @user_photo = current_user.photos
            @photos = @user_photo + @public_photo
            @photos.uniq!
        else
            @photos = @public_photo
            @photos = @photos
        end
        unless @photos.kind_of?(Array)
            @photos = @photos.page(params[:page]).per(@item_per_page)
        else
            @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(@item_per_page)
        end

    end
    
    def feed_albums
        @public_album = Album.where(mode: :public_mode)
        if user_signed_in? 
            if current_user.is_admin? 
                redirect_to albums_path
            end
            @user_album = current_user.albums
            @albums = @user_album + @public_album
            @albums.uniq!
        else
            @albums = @public_album
            @albums = @albums.uniq
        end
        unless @albums.kind_of?(Array)
            @albums = @albums.page(params[:page]).per(@item_per_page)
        else
            @albums = Kaminari.paginate_array(@albums).page(params[:page]).per(@item_per_page)
        end
    end

    def index
        @users = User.where(is_admin?: false ).page(params[:page]).per(@item_per_page)
    end

    def edit
    end

    def update
        respond_to do |format|
            if params[:active] = "active"
                @user.status = :active
            else
                @user.status = :inactive
            end
            
          if @user.update(user_params)
            format.html { redirect_to users_url, notice: 'User was successfully updated.' }
            format.json { render :show, status: :ok, location: @user }
          else
            format.html { render :edit }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end
    def set_item_per_page
        @item_per_page = 20
    end
    # Only allow admin to edit status on user
    def user_params
        params.require(:user).permit(:status)
    end
end
