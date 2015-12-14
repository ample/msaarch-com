module AdminHelper

  def recently_edited(klass, title='title')
    object = klass.order('updated_at DESC').first
    content_tag :li, ("#{object.class.name}: " + link_to(eval("object.#{title}"), eval("edit_#{object.class.name.tableize.singularize}_path(object)"))).html_safe if object
  end

  def nesting_object
    @nesting_object ||= begin
      params.each do |name, value|
        if name =~ /^([^_]+)_id$/
          klass = "#{$1}".classify.constantize
          return klass.find(value)
        end
      end
      nil
    end
  end
end
