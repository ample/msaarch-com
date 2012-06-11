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

  def tweet
    if twitter_id.blank? && active
      tweet = Twitter.update(linked_body)
      update_attributes :twitter_id => tweet.id.to_s
    end
  end

  def linked_body
    link.blank? ? body : "#{body} #{link}"
  end

end
