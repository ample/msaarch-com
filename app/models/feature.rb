require 'helpers'

class Feature < ActiveRecord::Base

  ###---------------------------------------------------- Associations

  belongs_to :project

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
    self.link.include?('vimeo') unless self.link.blank?
  end

  def video_id
    if (is_video? || self.feature_type == 'video') && !self.link.blank?
      self.link.gsub(/^[^0-9]*/, '')
    end
  end

  def not_image?
    !['image','headline'].include?(feature_type)
  end

end