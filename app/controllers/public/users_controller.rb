class Public::UsersController < PublicController
  def index
    params[:permalink] = 'team'
  end

  def show
    raise ActiveRecord::RecordNotFound if current_team_member.nil?
  end

  protected 
  
    helper_method :current_team_member
    
    def current_team_member
      @current_team_member ||= User.live.find( params[:id] ) rescue nil
    end

end
