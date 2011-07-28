class Message < ActiveRecord::Base

  ###---------------------------------------------------- Associations

  belongs_to :to, :class_name => 'User'

  ###---------------------------------------------------- Validations

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :organization
  validates_presence_of :title

end
