module Tableless augmentation do
  
  ###---------------------------------------------------- Tableless-ness
  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :id, :name
  class_inheritable_accessor :records
  
  ###---------------------------------------------------- Instance Methods
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def symbol
    @name.to_s.downcase.underscore.intern
  end
  
  def persisted?
    false
  end
  
  ###---------------------------------------------------- Class Methods
  
  def self.all
    self.records
  end
  
  def self.find(id)
    self.records.detect { |l| l.id == id }
  end
  
  def self.[](value)
    self.records.detect { |l| l.symbol == value.to_s.downcase.underscore.intern }
  end
  
  def self.column_name
    "#{self.model_name.element}_id"
  end

end end