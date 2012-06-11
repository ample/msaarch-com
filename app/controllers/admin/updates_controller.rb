class Admin::UpdatesController < AdminController

  set_model :update

  def index
    flash.keep
    redirect_to news_path
  end

  def create
    @current_object = model.new(params["#{self.class.model_sym}"])
    if current_object.save && current_object.tweet
      flash[:notice] = I18n.t('ample_admin.create.success', :model => self.class.model_sym.to_s.titleize)
      conditional_continue
    else
      flash[:error] = I18n.t('ample_admin.create.failure', :model => self.class.model_sym.to_s.titleize)
      render :action => :new
    end
  end

end
