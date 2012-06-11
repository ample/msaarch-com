require 'helpers'

class Update < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Validations

  validates_presence_of :body
  validates_uniqueness_of :twitter_id

  ###---------------------------------------------------- Instance Methods

  def title
    help.truncate(self.body)
  end

end
