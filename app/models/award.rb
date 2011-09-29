class Award < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Association

  belongs_to :project
  belongs_to :asset
  belongs_to :organization

  ###---------------------------------------------------- Validations

  validates_presence_of :title
  validates_presence_of :awarded_date

  ###---------------------------------------------------- Instance Methods

  def thumbnail
    if self.organization && self.organization.logo
      self.organization.logo
    elsif self.project.nil? || self.project.thumbnail.nil?
      self.asset
    else
      self.project.thumbnail 
    end
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
  
  def organization_name
    if self.project.nil?
      if self.project_name.blank?
        self.source_name
      else
        (self.title + (self.source_name.blank? ? '' : " &mdash; #{self.source_name}")).html_safe
      end
    else 
      (self.title + (self.source_name.blank? ? '' : " &mdash; #{self.source_name}")).html_safe
    end
  end
  
  def source_name
    if self.organization
     self.organization.title
    else
      self.source unless self.source.blank?
    end
  end

end
