class Admin::PagesController < AdminController
  
  set_model :page

  def destroy
    if current_page.permalink == 'home'
      flash[:error] = I18n.t('ample_admin.delete.homepage.failure')
      redirect_to :action => :index
    else
      super
    end
  end
  
  protected
  
    helper_method :current_pages
    
    def current_pages
      @current_pages ||= Page.root_level
    end

end