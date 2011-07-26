class Page < ActiveRecord::Base

  ###---------------------------------------------------- Class Methods

  def self.in_header
    @header_navigable ||= self.navigable('header')
  end

  def self.in_footer
    @footer_navigable ||= self.navigable('footer')
  end

  def self.navigable(position)
    Page.live.collect { |p| p if p.nav_position == position || p.nav_position == 'both' }.compact
  end

  ###---------------------------------------------------- Instance Methods

  def background
    block = self.get_block(:banner_image)
    unless block.nil?
      " style=\"background-image: url(#{block.asset.attachment.url}); \"".html_safe
    end
  end

end