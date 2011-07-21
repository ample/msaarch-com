require 'permalink_fu'
require 'acts_as_markup'

class Category < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :projectships, :dependent => :destroy
  has_many :projects, :through => :projectships,:source => :owner, :source_type => 'Project', :include => :asset

  has_and_belongs_to_many :groups
  has_and_belongs_to_many :markets

  ###---------------------------------------------------- Plugins

  acts_as_textile :body

  ###---------------------------------------------------- Validations

  validates_presence_of :title

  ###---------------------------------------------------- Instance Methods

  def projects_count
    projectships_count
  end
  

end
