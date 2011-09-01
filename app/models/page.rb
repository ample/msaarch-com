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
    @videos ||= features.live.where :feature_type => 'video'
  end
  
  def links
    @links ||= features.live.where :feature_type => 'link'
  end

  def locations
    @locations ||= features.live.where :feature_type => 'location'
  end

  def background_caption
    unless self.template_filename != 'home'
      block = self.get_block(:background_image_caption)
      sanitize(block.textarea.to_html).html_safe unless block.nil?
    end
  end

  def headlines
    @headlines ||= features.live.where :feature_type => 'headline'
  end

  def promotions
    @promotions ||= features.live.where :feature_type => 'promo'
  end

  def random_headline
    if headlines.empty?
      ''
    else
      page = headlines.sort_by{ rand }.slice(0...1).first.body
    end
  end

end