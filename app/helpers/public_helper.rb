module PublicHelper

  def body_classes
    classes = ''
    classes += 'homepage' if params[:controller] == 'public' && params[:action] == 'home'
    " class=\"#{classes}\"".html_safe unless classes.empty?
  end

  def background_image
    " style=\"background-image: url(/assets/pages/homepage/government-square.jpg)\"".html_safe
  end

  def is_homepage?
    params[:controller] == 'public' && params[:action] == 'home'
  end

  def site_nav(position)
    html = ''
    
    # link to navigable pages for current position
    pages = position == 'header' ? Page.in_header : Page.in_footer.reverse!    
    path = request.path.split('/')
    pages.each do |page|
      begin
        state = path.include?(page.permalink) || (path.empty? && ['home', 'index', 'welcome'].include?(page.permalink))  ? 'on' : ''
      rescue
        state = ''
      end
      html += content_tag :li, link_to(page.nav_name, page.hierarchy_permalink), :class => state
    end

    content_tag :ul, html.html_safe, :class => 'group'
  end

end
