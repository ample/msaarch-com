class Admin::AssetsController < AdminController
  
  def index
    per_page = params[:per_page] || 100
    conditions = nil

    if params[:type] == 'images'
      conditions = ["attachment_mime_type in (?)", ['image/jpeg','image/png','image/gif']]
    elsif params[:type] == 'documents'
      conditions = ["attachment_mime_type NOT in (?)", ['image/jpeg','image/png','image/gif']]
    end

    if params[:order] == 'touched_at'
      order = 'updated_at DESC'
    else
      order = 'created_at DESC'
    end
    
    if per_page.nil?
      @current_objects = Asset.find(:all, :order => order, :conditions => conditions)
    else 
      @current_objects = Asset.find(:all, :order => order, :conditions => conditions).paginate(:page => params[:page], :per_page => per_page)
    end    

    respond_to do |format|
      format.js { render :partial => 'admin/assets/asset_page', :content_type => :html }
      format.json { @current_objects }
      format.html { @current_objects }
    end
  end

  
  def show
    raise ActiveRecord::RecordNotFound if current_asset.nil?
    current_asset.touch
    render :file => "admin/assets/show", :layout => 'vanilla'
  end
  
  def update_color
    current_asset.update_attribute(:color, params[:asset][:color])
    render :nothing => true
  end
  
  def destroy
    current_asset.destroy
    if request.referrer.include?("#{AmpleAdmin::Engine.config.mount_at}assets")
      render :nothing => true
    else 
      redirect_to request.referrer
    end
  end
  
end
