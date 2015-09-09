module PublicHelper

	def body_classes
		classes = ''
		classes += ' homepage' if params[:controller] == 'public' && params[:action] == 'home'
		classes += ' portfolio market' if params[:controller] == 'public/markets'
		classes += ' portfolio project' if params[:controller] == 'public/projects'
		classes += ' team' if params[:controller] == 'public/users'
		classes += ' history' if params[:controller] == 'public/users' && params[:action] == 'history'
		classes += ' member' if params[:controller] == 'public/users' && params[:action] == 'show'
		classes += ' news' if params[:controller] == 'public/news'
		classes += ' archive' if params[:controller] == 'public/news' && params[:action] == 'archive'
		classes += ' awards' if params[:controller] == 'public/news' && params[:action] == 'awards'
		classes += ' contact' if params[:controller] == 'public/careers'
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

	def is_user?
		params[:controller] == 'public/users'
	end

	def is_team?
		is_user? && params[:action] == 'index'
	end

	def site_nav(position)
		html = ''
		pages = position == 'header' ? Page.in_header : Page.in_footer.reverse!
		path = request.path.split('/')
		pages.each do |page|
			begin
				state = path.include?(page.permalink) || (path.empty? && ['home', 'index', 'welcome'].include?(page.permalink))	 ? 'on' : ''
			rescue
				state = ''
			end
			if page.permalink == 'portfolio'
				state += ' drop'
				html += content_tag :li, link_to(page.nav_name, '#') + markets_nav, :class => state
			else
				children = ''
				link = page.hierarchy_permalink
				if !page.children.empty? && position == 'header'
					state += ' drop no-color'
					children = child_nav(page)
					link = '#'
				end
				html += content_tag :li, link_to(page.nav_name, link) + children, :class => state
			end
		end
		content_tag :ul, html.html_safe, :class => 'clearfix'
	end

	def child_nav(parent)
		children = ''
		parent.children_in_header.each do |page|
			permalink = page.hierarchy_permalink
			if page.permalink.include?('locations')
				permalink = "/contact"
			elsif page.permalink.include?('email')
				permalink = "/contact/email"
			end
			children += content_tag :li, link_to(page.nav_name, permalink)
		end
		content_tag(:div, content_tag(:ul, children.html_safe), :class => 'subnav')
	end

	def markets_nav
		children = ''
		Market.live.each do |market|
			children += content_tag :li, link_to(market.nav_name.gsub(/MSA/,'<strong>MSA</strong>').html_safe, portfolio_path(market.permalink), :class => market.permalink)
		end
		content_tag(:div, content_tag(:ul, children.html_safe), :class => 'subnav')
	end

	def project_thumbnail(project, dimensions = '154x96#', market = nil, overlay = true)
		if market.nil?
			unless current_market.nil?
				market = current_market
			else
				market = project.markets.first
			end
		end
		opts = { 'data-title' => project.title, 'data-dimensions' => dimensions }
		opts = {} if overlay == false
		if project.thumbnail.nil?
			link_to image_tag('pages/project/project-placeholder.jpg', :class => 'frame', :size => dimensions), portfolio_project_path(market.permalink, project.permalink), opts
		else
			link_to image_asset(project, :object => project.thumbnail, :dimensions => dimensions, :class => 'frame', :style => "border-color: #{project.thumbnail.hex}; "), portfolio_project_path(market.permalink, project.permalink), opts
		end
	end

	def path_to_project(project)
		portfolio_project_path(project.markets.first.permalink, project.permalink)
	end

	def title_pagination
		" Page #{params[:page]}" if params[:page] && params[:page].to_i > 1
	end

	def page_title
		@page_title && params[:permalink]!='index' ? "#{strip_tags(@page_title)}#{title_pagination}" : META[:page_title]
	end

	def market_styles
		html = '<style>'.html_safe
		Market.live.each do |market|
			html += ".#{market.permalink}, .#{market.permalink} a { ".html_safe
			html += "border-color: #{market.color}; color: #{market.text_color}; border-style: solid; ".html_safe
			html += "} section.#{market.permalink} {background-color: #{market.color}; } ".html_safe
		end
		html += '</style>'.gsub(/ /,'').html_safe
	end

	def homepage_backgrounds
		html = '<script>'
		html += "$(document).ready(function(){"
		html += "MSA['alpha_backgrounds'] = ['#{alpha_backgrounds}']; "
		html += "MSA['alpha_captions'] = ['#{alpha_captions}']; ".html_safe
		html += "MSA['alpha_rand'] = Math.floor(Math.random()*MSA['alpha_backgrounds'].length);	 "
		html += "$('#alpha').css('background-image','url(\\'' + MSA['alpha_backgrounds'][MSA['alpha_rand']] + '\\')'); "
		html += "$('div.caption .container').html(MSA['alpha_captions'][MSA['alpha_rand']]); "
		html += "});"
		html += '</script>'.gsub(/ /,'')
	end

	def random_titles
		html = '<script>'
		html += "$(document).ready(function(){"
		html += "MSA['random_titles'] = ['"
		html += "#{random_headlines} ".html_safe
		html += "']; MSA['random_titles_rand'] = Math.floor(Math.random()*MSA['random_titles'].length); "
		html += "$('h1.dark').css('opacity',0).show().html(MSA['random_titles'][MSA['random_titles_rand']]).delay(500).animate({'opacity':1}); "
		html += "});"
		html += '</script>'.gsub(/ /,'')
	end

end
