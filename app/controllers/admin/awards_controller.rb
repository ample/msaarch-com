class Admin::AwardsController < AdminController
  
  set_model :award
  
  protected
  
    helper_method :current_awards
  
    def current_awards
      Award.live.group_by(&:awarded_date).sort_by{ |a, b| a.strftime('%Y') }.reverse
    end
  
end
