module AlbumsHelper
  def show_album_image(model)
    html = ""
    html << image_tag(model.images[0].url, class: "album__image_1") if model.images[0] 
    html << image_tag(model.images[1].url, class: "album__image_2") if model.images[1] 
    html << image_tag(model.images[2].url, class: "album__image_3") if model.images[2]
    html.html_safe
  end
  
end
