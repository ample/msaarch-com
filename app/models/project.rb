require 'permalink_fu'
require 'acts_as_markup'

class Project < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_and_belongs_to_many :categories
  belongs_to :segment

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :nav_name

  ###---------------------------------------------------- Validations

  validates_presence_of :title

end
