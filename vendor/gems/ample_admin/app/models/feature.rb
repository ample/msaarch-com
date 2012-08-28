require 'acts_as_markup'

class Feature < ActiveRecord::Base

  ###---------------------------------------------------- Concerns

  augment Publishing
  augment Sorting
  augment Targeting

  ###---------------------------------------------------- Validations

  validates_presence_of :title, :if => :not_image?
  
  ###---------------------------------------------------- Associations

  belongs_to :owner, :polymorphic => true
  belongs_to :asset

  ###---------------------------------------------------- Plugins

  acts_as_textile :body

  ###---------------------------------------------------- Scopes

  scope :of_type, lambda { |feature_type| where(:feature_type => feature_type.to_s) }
      
  ###---------------------------------------------------- Instance Methods
  
  def type_name
    Feature.feature_types.detect { |f| f[1] == self.feature_type }[0]
  end

  def not_image?
    feature_type != 'image' && new_record?
  end

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    [
      ['Testimonial', 'testimonial'], 
      ['Image', 'image'],
    ]
  end

end