require 'acts_as_markup'
require 'helpers'

class Event < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Association

  belongs_to :asset

  ###---------------------------------------------------- Validations

  validates_presence_of :body
  validates_presence_of :event_date

  ###---------------------------------------------------- Plugins

  acts_as_textile :body

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

  ###---------------------------------------------------- Instance Methods

  def title 
    help.truncate help.strip_tags(self.body.to_html.html_safe), :length => 80
  end

end
