class Asset < ActiveRecord::Base

  ###---------------------------------------------------- Associations

  has_many :blocks, dependent: :nullify

  ###---------------------------------------------------- Instance Methods

  def hex
    color.blank? ? '#FFFFFF' : color
  end

end
