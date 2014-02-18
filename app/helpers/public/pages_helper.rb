module Public::PagesHelper

  def alpha_backgrounds
    current_page.features.live.of_type(:image).collect{ |img| 
      img.asset.attachment.url unless img.asset.nil? 
    }.compact.join('\',\'')
  end

  def alpha_captions
    current_page.features.live.of_type(:image).collect{ |img| 
      unless img.asset.nil? 
        if img.project.nil?
          "<strong>#{escape_javascript(img.title)}</strong> #{escape_javascript(img.body)}"
        else
          link = portfolio_project_path(img.project.markets.first.permalink, img.project.permalink)
          link_to("<strong>#{escape_javascript(img.title)}</strong> #{escape_javascript(img.body)}".html_safe,link)
        end
      end
    }.compact.join('\',\'').html_safe
  end

  def random_headlines 
    current_page.headlines.collect{ |headline|
      escape_javascript(textilize_without_paragraph(headline.body).html_safe)
    }.join('\',\'')
  end

end
