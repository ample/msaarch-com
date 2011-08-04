class Public::UsersController < PublicController

  def index
    params[:permalink] = 'team'
  end

  def show
    raise ActiveRecord::RecordNotFound if current_team_member.nil?
  end

  def history
    render :nothing => true, :layout => true
  end

  protected 
  
    helper_method :current_team_member, :current_events_by_group
    
    def current_team_member
      @current_team_member ||= User.live.find( params[:id] ) rescue nil
    end
    
    def current_events
      @current_events ||= Event.live.group_by(&:event_date).sort_by{ |a, b| a.strftime('%Y') }
    end

    def current_events_by_group
      @current_events_by_group ||= current_events.collect{ |group| [group[0], group[1].group_by(&:event_type)] }
    end

end
