class Award < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Association

  belongs_to :project
  belongs_to :asset

  ###---------------------------------------------------- Validations

  validates_presence_of :title
  validates_presence_of :source

end
