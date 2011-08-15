class Admin::PostsController < AdminController

  set_model :post
  cache_sweeper :post_sweeper

  def index
    flash.keep
    redirect_to news_path
  end

end
