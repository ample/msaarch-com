class Admin::EventsController < AdminController

  set_model :event

  protected
  
    helper_method :current_events
  
    def current_events
      Event.live.group_by(&:event_date).sort_by{ |a, b| a.strftime('%Y') }.reverse
    end
  
end
