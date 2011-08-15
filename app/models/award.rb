class Award < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Association

  belongs_to :project
  belongs_to :asset

  ###---------------------------------------------------- Validations

  validates_presence_of :title
  validates_presence_of :awarded_date

  ###---------------------------------------------------- Instance Methods

  def thumbnail
    self.asset
  end

  def permalink
    self.project.permalink rescue nil?
  end

  def display_name
    display_name = ''
    unless self.project.nil? 
      display_name += self.project.title
    else
      display_name +=  self.project_name unless self.project_name.blank?
    end
    display_name += display_name.blank? ? self.title : " - #{self.title}"
    display_name.truncate(80)
  end

end
