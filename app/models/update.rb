require 'helpers'

class Update < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Sorting

  ###---------------------------------------------------- Validations

  validates_presence_of :body
  validates_uniqueness_of :twitter_id

  ###---------------------------------------------------- Associations

  belongs_to :media, :class_name => 'Asset'

  ###---------------------------------------------------- Attributes

  accepts_nested_attributes_for :media

  ###---------------------------------------------------- Scopes

  scope :with_media, lambda { where("#{table_name}.media_id IS NOT NULL") }

  ###---------------------------------------------------- Instance Methods

  def title
    help.truncate(self.body)
  end

  def tweet
    if twitter_id.blank? && active
      tweet = ::TwitterClient.update(linked_body)
      update_attributes :twitter_id => tweet.id.to_s
    end
  end

  def linked_body
    link.blank? ? body : "#{help.truncate(body, length: 117)} #{link}"
  end

end
