require 'permalink_fu'
require 'acts_as_markup'

class Post < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  belongs_to :asset
  has_many :features, -> { includes(:asset) }, :as => :owner

  ###---------------------------------------------------- Plugins

  acts_as_textile :teaser
  acts_as_textile :body
  has_permalink :title

  ###---------------------------------------------------- Validations

  validates_presence_of :title

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    feature_types = [ 'video' ]
    Feature.feature_types.collect { |feature_type| feature_type if feature_types.include?(feature_type[1])  }.compact
  end

  ###---------------------------------------------------- Instance Methods

  def videos
    features.live.where :feature_type => 'video'
  end

end
