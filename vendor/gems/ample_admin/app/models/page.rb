require 'permalink_fu'
require 'acts_as_markup'

class Page < ActiveRecord::Base

  ###---------------------------------------------------- Attributes

  alias_attribute :to_s, :nav_name

  ###---------------------------------------------------- Augmentations

  augment Publishing
  augment Nesting
  augment Sorting
  augment Templating

  ###---------------------------------------------------- Scopes

  scope :in_nav, lambda { |location| where(:nav_position => location.to_s) }

  ###---------------------------------------------------- Callbacks

  before_save :remove_blank_blocks

  ###---------------------------------------------------- Associations

  has_many :features, :as => :owner, :include => [ :asset ]
  has_many :blocks, :dependent => :destroy
  accepts_nested_attributes_for :blocks

  ###---------------------------------------------------- Plugins

  acts_as_textile :body
  has_permalink :nav_name

  ###---------------------------------------------------- Validations

  validates_presence_of :title
  validates_presence_of :nav_name

  ###---------------------------------------------------- Instance Methods

  def in_header?
    nav_position == 'header'
  end

  def get_block(name)
    blocks.where(:name => name.to_s, :block_type => template.fields.detect { |k,v| k == name.to_s }[1]).first
  rescue
    nil
  end

  def remove_blank_blocks
    blocks.each do |block|
      block.destroy if block.body.blank? && block.asset_id.blank? && block.textarea.blank?
    end
  end

  ###---------------------------------------------------- Class Methods

  # Available locations for nav items
  def self.nav_positions_for_select
    AmpleAdmin::Engine.config.nav_positions
  end

end