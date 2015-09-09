module AdminHelper

  def recently_edited(klass, title='title')
    object = klass.order('updated_at DESC').first
    content_tag :li, ("#{object.class.name}: " + link_to(eval("object.#{title}"), eval("edit_#{object.class.name.tableize.singularize}_path(object)"))).html_safe if object
  end

end
