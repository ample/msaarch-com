require 'permalink_fu'
require 'acts_as_markup'

class Career < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  belongs_to :user

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :title

  ###---------------------------------------------------- Validations

  validates_presence_of :title
  validates_presence_of :user

end
