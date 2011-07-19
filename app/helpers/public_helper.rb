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
    pages = position == 'header' ? Page.in_header : Page.in_footer.reverse!    
    path = request.path.split('/')
    pages.each do |page|
      begin
        state = path.include?(page.permalink) || (path.empty? && ['home', 'index', 'welcome'].include?(page.permalink))  ? 'on' : ''
      rescue
        state = ''
      end
      if page.permalink == 'portfolio'
        state += ' drop'
        html += content_tag :li, link_to(page.nav_name, '#') + segments_nav, :class => state
      else
        html += content_tag :li, link_to(page.nav_name, page.hierarchy_permalink), :class => state
      end
    end
    content_tag :ul, html.html_safe, :class => 'clearfix'
  end

  def segments_nav
    children = ''
    Segment.live.each do |segment|
      children += content_tag :li, link_to(segment.nav_name, portfolio_path(segment.permalink))
    end
    content_tag(:div, content_tag(:ul, children.html_safe), :class => 'subnav')
  end

end
