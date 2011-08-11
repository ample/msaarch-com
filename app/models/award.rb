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
  validates_presence_of :awarded_date

  ###---------------------------------------------------- Validations

  def thumbnail
    self.asset
  end

  def permalink
    self.project.permalink rescue nil?
  end

end
