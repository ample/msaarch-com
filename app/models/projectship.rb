class Projectship < ActiveRecord::Base
  
  ###---------------------------------------------------- Associations

  belongs_to :project
  belongs_to :owner, :polymorphic => true, :counter_cache => true

end