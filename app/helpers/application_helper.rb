module ApplicationHelper
  include Twitter::Autolink

  def link_to_section(cont, name, url, html_options = {})
    html_options[:class] = "active" if cont.include? controller.controller_name
    html_options[:title] = name
    link_to(name, url, html_options)
  end

end
