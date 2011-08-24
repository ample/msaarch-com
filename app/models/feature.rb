require 'helpers'

class Feature < ActiveRecord::Base

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    [
      ['Interior Page Copy', 'copy'], 
      ['Testimonial', 'testimonial'], 
      ['Promotion', 'promo'],  
      ['Image', 'image'],
      ['Product Header', 'product_header'],
      ['Video', 'video'],
      ['File Download', 'download'],
      ['Link', 'link'],
      ['Feature', 'feature'],
      ['Location', 'location'],
      ['Quote', 'quote'],
      ['Headline', 'headline'],
    ]
  end

  ###---------------------------------------------------- Instance Methods

  def display_name
    if self.feature_type == 'headline'
      help.strip_tags(self.body)
    else
      self.title
    end
  end

  def is_video?
    self.link.include?('youtube') unless self.link.blank?
  end

  def video_id
    if (is_video? || self.feature_type == 'video') && !self.link.blank?
      params = Rack::Utils.parse_nested_query(self.link.gsub(/^[^?]*\?/, ''))
      params['v'] if params.has_key?('v')
    end
  end

  def not_image?
    !['image','headline'].include?(feature_type)
  end

end