require 'permalink_fu'
require 'acts_as_markup'

class User < ActiveRecord::Base

  ###---------------------------------------------------- AR Callbacks

  before_validation :generate_password

  ###---------------------------------------------------- Augmentations

  augment Publishing

  ###---------------------------------------------------- Plugins

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, 
                  :credentials, :education, :bio, :favorite_ids, :project_ids, :expertise_ids, :admin, :active,
                  :permalink, :bio, :projectships_count, :asset_id, :active_at, :inactive_at, :title

  acts_as_textile :bio
  acts_as_textile :education
  has_permalink :full_name

  ###---------------------------------------------------- Associations

  has_many :features, :as => :owner, :include => [ :asset ]
  has_many :projectships, :as => :owner, :dependent => :destroy
  has_many :projects, :through => :projectships
  has_many :careers
  has_and_belongs_to_many :expertise, :class_name => 'Market'
  has_and_belongs_to_many :favorites, :class_name => 'Project'
  belongs_to :asset

  ###---------------------------------------------------- Validations

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    feature_types = [ 'link', 'quote' ]
    Feature.feature_types.collect { |feature_type| feature_type if feature_types.include?(feature_type[1])  }.compact
  end

  ###---------------------------------------------------- Instance Methods

  def to_param
    "#{id}-#{permalink}"
  end

  def links
    features.live.where :feature_type => 'link'
  end

  def quotes
    features.live.where :feature_type => 'quote'
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def generate_password
    unless self.admin?
      self.password = ActiveSupport::SecureRandom.base64(8).to_yaml
      self.password_confirmation = self.password
    end
  end

end
