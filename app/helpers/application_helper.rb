module ApplicationHelper
  def form_errors (model, opt={})
    if model.errors.any? 
      li_list = ""
      model.errors.full_messages.each do |message| 
        li = opt.key?(:li_class) ? "<li class='#{opt[:li_class]}'> #{message} </li>" : "<li> #{message} </li>" 
        li_list << li
      end 
      ul_class = opt.key?(:ul_class) ? "#{opt[:ul_class]}" : ""
      ul = content_tag(:ul, li_list.html_safe, class: "text-danger #{ul_class}")
    end 
  end

  def show_private_icons(model)
    if !current_user.is_admin?
      if model.mode == :private_mode.to_s 
          '<div class="sharing_mode">
              <i class="fas fa-lock"></i>
          </div>'.html_safe
      end 
    end 
  end

  def btn_add_new(label = "Add New", path)
    if !current_user.is_admin?
      link = link_to label, path, class: "btn btn-success"
      "<div id='header__photo__list'>
        #{link}
      </div>
      <div class='seperator'></div>".html_safe
    end
  end

  def header_logo_tag(opt = {})
    if user_signed_in? 
      if current_user.is_admin? 
        link_to 'Fotobook Admin', photos_path, class: opt[:class] || navbar-brand
      else 
        link_to 'Fotobook', root_path, class: opt[:class] || navbar-brand
      end 
    end 
  end

  def avatar_tag
    if current_user.avatar?
      image_tag current_user.avatar_url, class: "w-100"
    else
      "<span class='admin_avatar mr-2'> #{current_user.first_name[0] << current_user.last_name[0]} </span>".html_safe
    end
  end

  def signin_signout_tag
    if user_signed_in? 
      name_link = link_to "#{current_user.first_name} #{current_user.last_name}", edit_user_registration_path, :class => 'admin_name mr-5'  
      avatar_link = link_to edit_user_registration_path, class: 'admin_name admin_avatar mr-3' do 
        avatar_tag 
      end
      logout_link = link_to 'Logout', destroy_user_session_path, method: :delete, :class => 'nav-link'
      "#{avatar_link} #{name_link} #{logout_link}".html_safe
    else 
      link_to "Login", new_user_session_path, :class => 'nav-link'  
    end           
  end

  def desktop_sidebar_menu(opt=[])
    html = ""
    opt.each do |link|
      if link.length === 2
        begin
          temp_link = link_to link[0].to_s, link[1], class: "category__item"
        rescue => exception
          temp_link = exception
        end 
      else
        temp_link = "Must pass into this two param 'label' and 'path' to generate link_to exactly"
      end
      html << temp_link
    end
      html.html_safe
  end

  def mobile_sidebar_menu(opt=[])
    html = ""
    opt.each do |link|
      if link.length === 2
        begin
          temp_link = link_to link[1], class: "category__item active" do 
                        link[0].html_safe
                      end 
        rescue => exception
          temp_link = exception
        end 
      else
        temp_link = "Must pass into this two param 'label' and 'path' to generate link_to exactly"
      end
      html << temp_link
    end
      html.html_safe
  end

  def sidebar_menu_tag
    if user_signed_in? 
      if current_user.is_admin? 
        "<nav class='category'>
          #{desktop_sidebar_menu [['Manager Photos', photos_path],['Manager Albums', albums_path],['Manager Users', users_path]]}
        </nav>
        <nav class='category_mobile'>
          #{mobile_sidebar_menu [["<i class='fas fa-2x fa-image'></i>",photos_path],["<i class='fas fa-2x fa-images'></i>",albums_path],["<i class='fas fa-2x fa-user'></i>",users_path]]}
        </nav>".html_safe
      else 
        "<nav class='category'>
          #{desktop_sidebar_menu [['Feeds', root_path],['My Photos', photos_path],['My Albums', albums_path]]}
        </nav>
        <nav class='category_mobile'>
          #{mobile_sidebar_menu [["<i class='fas fa-2x fa-comment-alt'></i>",root_path],["<i class='fas fa-2x fa-image'></i>",photos_path],["<i class='fas fa-2x fa-images'></i>",albums_path]]}
        </nav>".html_safe
      end 
    end 
  end
end
