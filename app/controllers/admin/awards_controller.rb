class Admin::AwardsController < AdminController
  
  set_model :award
  
  protected
  
    helper_method :current_awards
  
    def current_awards
      Award.all.group_by(&:awarded_date).reject{ |d| d.nil? }.sort_by{ |a, b| a.strftime('%Y') }.reverse
    end
  
end
