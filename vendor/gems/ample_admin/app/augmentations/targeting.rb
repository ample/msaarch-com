# Usage:
#   Migration:
#     t.string :target_customer_status
#   Model:
#     targeted_for :customer_status, :values => [:current_customer, :prospective_customer], :default => :prospective_customer
#   Controller
#     Feature.live.targeted_for_customer_status(:current_customer)
#   View
#     f.select :target_customer_status, f.object.target_customer_status_options_for_select

module Targeting augmentation do

  def self.targeted_for(dimension, options = {})

    instance_variable_set("@target_#{dimension}_options_for_select", options[:values].collect { |option| [option.to_s.humanize, option.to_s] })
    instance_variable_set("@target_#{dimension}_default", options[:default])

    scope "targeted_for_#{dimension}".to_sym, lambda { |*value|
      target = value.first.blank? ? instance_eval("@target_#{dimension}_default") : value.first.to_s
      where(["target_#{dimension} = ? OR target_#{dimension} IS NULL", target])
    }

  end

end end