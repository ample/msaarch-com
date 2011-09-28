class Organization < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations
  
  augment Publishing
  
  ###---------------------------------------------------- Validations
  
  validates_presence_of :title
  
  ###---------------------------------------------------- Associations
  
  has_many :awards
  belongs_to :logo, :class_name => 'Asset'
  
end
