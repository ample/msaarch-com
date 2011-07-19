require 'permalink_fu'
require 'acts_as_markup'

class Segment < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :projects
  belongs_to :asset

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :nav_name

  ###---------------------------------------------------- Validations

  validates_presence_of :title

end
