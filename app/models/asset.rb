class Asset < ActiveRecord::Base

  ###---------------------------------------------------- Associations

  has_many :blocks, dependent: :nullify

  ###---------------------------------------------------- Plugins

  has_paper_trail

  ###---------------------------------------------------- Instance Methods

  def hex
    color.blank? ? '#FFFFFF' : color
  end

end
