require 'acts_as_markup'

class Block < ActiveRecord::Base

  ###---------------------------------------------------- Scopes

  default_scope order('name ASC')

  ###---------------------------------------------------- Associations

  belongs_to :page
  belongs_to :asset

  ###---------------------------------------------------- Plugins

  acts_as_textile :textarea

end
