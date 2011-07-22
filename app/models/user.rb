require 'permalink_fu'
require 'acts_as_markup'

class User < ActiveRecord::Base

  ###---------------------------------------------------- Augmentations

  augment Publishing

  ###---------------------------------------------------- Plugins

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, 
                  :credentials, :education, :bio, :favorite_ids, :project_ids, :admin, :active,
                  :permalink, :bio, :projectships_count, :asset_id, :active_at, :inactive_at

  acts_as_textile :body
  has_permalink :name

  ###---------------------------------------------------- Associations

  has_many :features, :as => :owner, :include => [ :asset ]
  has_many :projectships, :as => :owner, :dependent => :destroy
  has_many :projects, :through => :projectships
  has_and_belongs_to_many :favorites, :class_name => 'Project'
  belongs_to :asset

  ###---------------------------------------------------- Validations

  validates_presence_of :name
  validates_presence_of :email

  ###---------------------------------------------------- Class Methods

  def self.feature_types
    feature_types = [ 'link' ]
    Feature.feature_types.collect { |feature_type| feature_type if feature_types.include?(feature_type[1])  }.compact
  end

  ###---------------------------------------------------- Instance Methods

  def to_param
    "#{id}-#{permalink}"
  end

  def links
    features.live.where :feature_type => 'link'
  end

end
