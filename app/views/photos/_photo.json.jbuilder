json.extract! photo, :id, :image, :title, :description, :mode, :album_id, :created_at, :updated_at
json.url photo_url(photo, format: :json)
