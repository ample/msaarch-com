class Admin::FeaturesController < AdminController
  
  set_model :feature
  
  def new
    super
    current_feature.feature_type = params[:feature_type]
  end
  
  def create 
    super
    if current_feature.feature_type == 'image' && params[:feature][:title].blank?
      current_feature.title = "Image #{current_feature.id}"
      current_feature.save
    end
  end

  def update
    super
    if current_feature.feature_type == 'image' && !current_feature.asset.nil? && params[:feature][:title].blank?
      current_feature.title = current_feature.asset.attachment_name
      current_feature.save
    end
  end


  def destroy
    current_object.destroy
    render :nothing => true
  end
  
  protected
  
  helper_method :current_owner
  
  def current_owner
    @current_owner ||= find_owner
  end
  
  def find_owner
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
  def conditional_continue(return_url = nil, continue_url = nil)
    if params[:continue]
      url = continue_url || [:edit, current_owner, current_feature] 
    else
      url = return_url || [:edit, current_owner] 
    end
    redirect_to url
  end
  
end