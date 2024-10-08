class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
      if current_user.is_admin? 
          @photos = Photo.all 
      else
        @photos = current_user.photos
      end
      @item_per_page = 20
      @item_per_page = 40  if current_user.is_admin? 
      if @photos.kind_of?(Array)
        @photos = Kaminari.paginate_array(@photos).page(params[:page]).per(@item_per_page)
      else
        @photos = @photos.page(params[:page]).per(@item_per_page)
      end
      
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = current_user.photos.create(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to photos_url, notice: 'Photo was successfully created.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to photos_url, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:image, :title, :description, :mode)
    end
end
