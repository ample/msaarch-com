module TablelessAssociation augmentation do
  
  class_inheritable_accessor :association_model
  
  def method_missing(sym, *args, &block)
    return association_record if sym == self.association_model.model_name.element.to_sym
    super(sym, *args, &block)
  end
  
  
  def association_record
    self.association_model.find(eval(self.association_model.column_name))
  end

end end