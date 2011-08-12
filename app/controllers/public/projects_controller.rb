class Public::ProjectsController < PublicController

  def show
    raise ActiveRecord::RecordNotFound if current_project.nil?
    @page_title = META[:page_title]
    @page_title = "#{current_project.nav_name} | #{@page_title}"
    @meta_keywords = current_project.meta_keywords
    @meta_description = current_project.meta_description
  end

  private

    helper_method :current_project

    def current_project
      project = Project.live.find_by_permalink(params[:permalink])
      project.markets.include?(current_market) ? project : nil rescue nil
    end

end
