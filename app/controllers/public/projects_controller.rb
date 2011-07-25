class Public::ProjectsController < PublicController

  def show
    raise ActiveRecord::RecordNotFound if current_project.nil?
    
  end

  private

    helper_method :current_project

    def current_project
      project = Project.live.find_by_permalink(params[:permalink])
      project.markets.include?(current_market) ? project : nil 
    end

end
