require 'permalink_fu'
require 'acts_as_markup'

class Market < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Associations

  has_many :projects
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
      " style=\"background-image: url(#{banner.attachment.url}); \"".html_safe
    end
  end

end
