require 'permalink_fu'
require 'acts_as_markup'

class Market < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :projectships, :as => :owner, :dependent => :destroy
  has_many :projects, :through => :projectships
  has_many :features, :as => :owner, :include => [ :asset ]
  belongs_to :banner, :class_name => 'Asset'
  belongs_to :logo, :class_name => 'Asset'

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :nav_name

  ###---------------------------------------------------- Validations

  validates_presence_of :title

  ###---------------------------------------------------- Instance Methods

  def background
    unless banner.blank?
      " style=\"background-image: url(#{banner.attachment.url}); \"".html_safe
    end
  end

  def videos
    features.live.collect { |feature| feature if feature.feature_type == 'video' }.compact
  end

  #def categories
  #  cat = projects.live.collect{ |project| project.categories }.flatten.uniq.compact
  #end

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    feature_types = [ 'testimonial', 'video' ]
    Feature.feature_types.collect { |feature_type| feature_type if feature_types.include?(feature_type[1])  }.compact
  end

end
