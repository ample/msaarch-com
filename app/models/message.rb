class Message < ActiveRecord::Base

  ###---------------------------------------------------- Associations

  belongs_to :to, :class_name => 'User'

  ###---------------------------------------------------- Validations

  validates_presence_of :to
  validates_presence_of :from, :message => "name can't be blank"
  validates_presence_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create, :if => :email_present?
  validates_presence_of :organization
  validates_presence_of :subject

  ###---------------------------------------------------- Instance Methods

  def email_present?
    !self.email.blank?
  end

end
