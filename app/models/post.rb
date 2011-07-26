require 'permalink_fu'
require 'acts_as_markup'

class Post < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  belongs_to :asset

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :title

  ###---------------------------------------------------- Validations

  validates_presence_of :title

end