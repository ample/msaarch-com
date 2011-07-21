require 'permalink_fu'
require 'acts_as_markup'

class Project < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :features, :as => :owner, :include => [ :asset ]
  has_many :projectships, :dependent => :destroy
  has_many :categories, :through => :projectships, :source => :owner, :source_type => 'Category'
  has_many :markets, :through => :projectships, :source => :owner, :source_type => 'Market'
  belongs_to :thumbnail, :class_name => 'Asset'

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :nav_name

  ###---------------------------------------------------- Validations

  validates_presence_of :title

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    feature_types = [ 'image' ]
    Feature.feature_types.collect { |feature_type| feature_type if feature_types.include?(feature_type[1])  }.compact
  end

end
