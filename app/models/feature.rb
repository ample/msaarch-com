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
    ]
  end

  ###---------------------------------------------------- Instance Methods

  def video_id
    if self.feature_type == 'video' && !self.link.blank?
      params = Rack::Utils.parse_nested_query(self.link.gsub(/^[^?]*\?/, ''))
      params['v'] if params.has_key?('v')
    end
  end

end