module Public::CareersHelper

  def show_flashes
    messages = ''.html_safe 
    flash.collect { |k,v| 
      messages << "<div class='flash #{k}'> <strong>#{v.html_safe}</strong>".html_safe
      if k==:error && @message.errors.any?
        messages << '<ul>'.html_safe
          @message.errors.full_messages.each do |msg| 
            messages << content_tag(:li, msg)
          end
        messages << '</ul>'.html_safe
      end
      messages << '</div>'.html_safe
    }
    content_tag(:div, messages, :id => 'notifications')
  end

end
