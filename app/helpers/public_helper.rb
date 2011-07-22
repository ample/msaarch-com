module PublicHelper

  def body_classes
    classes = ''
    classes += ' homepage' if params[:controller] == 'public' && params[:action] == 'home'
    classes += ' portfolio market' if params[:controller] == 'public/markets'
    classes += ' portfolio project' if params[:controller] == 'public/projects'
    " class=\"#{classes.lstrip}\"".html_safe unless classes.empty?
  end

  def is_homepage?
    params[:controller] == 'public' && params[:action] == 'home'
  end

  def is_market?
    params[:controller] == 'public/markets'
  end

  def is_project?
    params[:controller] == 'public/projects'
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
        html += content_tag :li, link_to(page.nav_name, '#') + markets_nav, :class => state
      else
        html += content_tag :li, link_to(page.nav_name, page.hierarchy_permalink), :class => state
      end
    end
    content_tag :ul, html.html_safe, :class => 'clearfix'
  end

  def markets_nav
    children = ''
    Market.live.each do |market|
      children += content_tag :li, link_to(market.nav_name, portfolio_path(market.permalink), :class => market.permalink)
    end
    content_tag(:div, content_tag(:ul, children.html_safe), :class => 'subnav')
  end

end
