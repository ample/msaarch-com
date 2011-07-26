class Admin::UpdatesController < AdminController

  set_model :update

  def index
    flash.keep
    redirect_to news_path
  end

end
