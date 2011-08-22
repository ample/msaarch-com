module Public::PagesHelper

  def alpha_backgrounds
    current_page.features.live.of_type(:image).collect{ |img| 
      img.asset.attachment.url unless img.asset.nil? 
    }.compact.join('\',\'')
  end

  def alpha_captions
    current_page.features.live.of_type(:image).collect{ |img| 
      "<strong>#{escape_javascript(img.title)}</strong> #{escape_javascript(img.body)}" unless img.asset.nil? 
    }.compact.join('\',\'').html_safe
  end

end
