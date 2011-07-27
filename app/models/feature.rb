class Feature < ActiveRecord::Base

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
    ]
  end

end