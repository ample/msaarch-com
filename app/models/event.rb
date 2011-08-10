class Event < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Association

  belongs_to :asset

  ###---------------------------------------------------- Validations

  validates_presence_of :title
  validates_presence_of :event_date

  ###---------------------------------------------------- Class Methods

  def self.event_types
    [
      ['MSA Events', 'msa'], 
      ['Local Events', 'local'], 
      ['World Events', 'global'],  
    ]
  end

  def self.options_for_select
    self.event_types.collect { |r| [r[0], r[1]] }
  end

end
