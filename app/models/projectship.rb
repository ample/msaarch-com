class Projectship < ActiveRecord::Base
  
  ###---------------------------------------------------- Associations

  belongs_to :category, :counter_cache => true
  
end