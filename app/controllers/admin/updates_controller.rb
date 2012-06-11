class Admin::UpdatesController < AdminController

  set_model :update

  def index
    flash.keep
    redirect_to news_path
  end

  def create
    @current_object = model.new(params["#{self.class.model_sym}"])
    if current_object.save
      send_tweet unless current_object.twitter_id || !current_object.active
      flash[:notice] = I18n.t('ample_admin.create.success', :model => self.class.model_sym.to_s.titleize)
      conditional_continue
    else
      flash[:error] = I18n.t('ample_admin.create.failure', :model => self.class.model_sym.to_s.titleize)
      render :action => :new
    end
  end

  private

    def send_tweet
      body = current_object.link ? "#{current_object.body} #{current_object.link}" : current_object.body
      tweet = Twitter.update(current_object.body)
      current_object.update_attributes :twitter_id => tweet.id.to_s
    end

end
