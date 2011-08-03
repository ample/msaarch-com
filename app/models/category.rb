require 'permalink_fu'
require 'acts_as_markup'

class Category < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Nesting
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :projectships, :as => :owner, :dependent => :destroy
  has_many :projects, :through => :projectships

  ###---------------------------------------------------- Plugins

  has_permalink :title

  ###---------------------------------------------------- Validations

  validates_presence_of :title

  ###---------------------------------------------------- Instance Methods

  def projects_count
    projectships_count
  end

  def market_projects_count(market)
    market.projects.collect{ |project| project if project.categories.include?(self) }.compact.uniq.size
  end

  def hierarchy
    parent.nil? ? title : "#{parent.hierarchy} > #{title}"
  end

  ###---------------------------------------------------- Class Methods

  def self.fit_parents
    all.select { |p| p.parents_count < 1 }
  end

end
