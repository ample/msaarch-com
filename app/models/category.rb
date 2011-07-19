require 'permalink_fu'
require 'acts_as_markup'

class Category < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_and_belongs_to_many :projects, :include => :asset

  ###---------------------------------------------------- Plugins

  acts_as_textile :body

  ###---------------------------------------------------- Validations

  validates_presence_of :title

end
