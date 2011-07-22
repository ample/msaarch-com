require 'permalink_fu'
require 'acts_as_markup'

class Project < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :awards
  has_many :features, :as => :owner, :include => [ :asset ]
  has_many :projectships
  has_many :categories, :through => :projectships, :source => :owner, :source_type => 'Category'
  has_many :markets, :through => :projectships, :source => :owner, :source_type => 'Market'
  has_many :users, :through => :projectships, :source => :owner, :source_type => 'User'
  belongs_to :thumbnail, :class_name => 'Asset'

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  acts_as_textile :teaser
  has_permalink :nav_name

  ###---------------------------------------------------- Validations

  validates_presence_of :title

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    feature_types = [ 'image', 'link' ]
    Feature.feature_types.collect { |feature_type| feature_type if feature_types.include?(feature_type[1])  }.compact
  end

  ###---------------------------------------------------- Instance Methods

  def images
    features.live.where :feature_type => 'image'
  end

  def links
    features.live.where :feature_type => 'link'
  end

  
end
