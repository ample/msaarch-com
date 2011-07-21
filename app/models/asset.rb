class Asset < ActiveRecord::Base
  
  ###---------------------------------------------------- Instance Methods

  def hex
    color.blank? ? '#FFFFFF' : color
  end
  
end