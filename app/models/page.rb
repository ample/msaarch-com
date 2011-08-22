class Page < ActiveRecord::Base

  ###---------------------------------------------------- Class Methods

  def self.in_header
    @header_navigable ||= self.navigable('header')
  end

  def self.in_footer
    @footer_navigable ||= self.navigable('footer')
  end

  def self.navigable(position)
    Page.live.order('sort_order ASC').collect { |p| p if p.nav_position == position || p.nav_position == 'both' }.compact.reverse
  end

  ###---------------------------------------------------- Instance Methods

  def background
    block = self.get_block(:background_image)
    unless block.nil?
      " style=\"background-image: url(#{block.asset.attachment.url}); \"".html_safe
    end
  end

  def videos
    features.live.where :feature_type => 'video'
  end
  
  def links
    features.live.where :feature_type => 'link'
  end

  def locations
    features.live.where :feature_type => 'location'
  end

  def background_caption
    unless self.template_filename != 'home'
      block = self.get_block(:background_image_caption)
      block.textarea.to_html.html_safe unless block.nil?
    end
  end

end