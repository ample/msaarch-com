class Admin::NewsController < AdminController

  def index
  end

  protected

    helper_method :current_posts, :current_updates

    def current_updates
      per_page = params[:per_page] || 15
      @current_updates ||= Update.find(:all, :order => 'created_at DESC').paginate(:page => params[:updates_page], :per_page => per_page)
    end

    def current_posts
      per_page = params[:per_page] || 15
      @current_posts ||= Post.find(:all, :order => 'created_at DESC').paginate(:page => params[:posts_page], :per_page => per_page)
    end

end
