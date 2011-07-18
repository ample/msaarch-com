module PublicHelper

  def body_classes
    classes = ''
    classes += 'homepage' if params[:controller] == 'public' && params[:action] == 'home'
    " class=\"#{classes}\"".html_safe unless classes.empty?
  end

  def background_image
    " style=\"background-image: url(/assets/pages/homepage/government-square.jpg)\"".html_safe
  end

end
