class Public::PagesController < PublicController

  def show
    raise ActiveRecord::RecordNotFound if current_page.nil?
    respond_to do |format|
      format.html do
        #@page_title = META[:page_title]
        @page_title = "#{current_page.nav_name} | #{@page_title}"
        @meta_keywords = current_page.meta_keywords
        @meta_description = current_page.meta_description
        render :template => current_page.template.view_path
      end
    end
  end
  
end