require 'permalink_fu'
require 'acts_as_markup'

class Market < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :projectships, :as => :owner, :dependent => :destroy
  has_many :projects, :through => :projectships
  has_many :features, -> { includes(:asset) }, :as => :owner
  has_and_belongs_to_many :experts, :class_name => 'User'
  has_and_belongs_to_many :categories
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
      " style=\"background-image: url(#{ActionController::Base.asset_host}#{banner.attachment.url}); \"".html_safe
    end
  end

  def videos
    features.live.collect { |feature| feature if feature.feature_type == 'video' }.compact
  end

  def project_categories
    projects.live.includes( :categories ).collect( &:categories ).flatten.uniq.sort_by( &:parent_id )
  end

  def featured_projects
    projectships.collect{ |projectship| projectship.project if projectship.featured? }.compact
  end

  def sorted_projects
    self.projects.active.sort{ |a,b| a[:title] <=> b[:title] }
  end

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    feature_types = [ 'video' ]
    Feature.feature_types.collect { |feature_type| feature_type if feature_types.include?(feature_type[1])  }.compact
  end

  def self.update_project_counters
    Market.all.each do |market|
      market.update_attribute :projectships_count, market.projects.collect{ |p| p if p.active? }.compact.length
    end
  end

end
