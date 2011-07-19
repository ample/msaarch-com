require 'permalink_fu'
require 'acts_as_markup'

class Category < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_and_belongs_to_many :projects, :include => :asset
  belongs_to :asset

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :nav_name

  ###---------------------------------------------------- Validations

  validates_presence_of :title


end
