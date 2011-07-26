class Admin::PostsController < AdminController

  set_model :post

  def index
    flash.keep
    redirect_to news_path
  end

end
