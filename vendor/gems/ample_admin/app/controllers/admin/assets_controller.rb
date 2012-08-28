class Admin::AssetsController < AdminController
  
  set_model :asset
  
  respond_to :html, :js
  
  def index
    per_page = params[:per_page] || 45
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
    if request.xhr?
      current_asset.touch
      render :file => "admin/assets/show", :layout => false
    end
  end

  def destroy
    current_asset.destroy
    if request.referrer.include?("#{AmpleAdmin::Engine.config.mount_at}assets")
      if request.xhr?
        render :nothing => true
      else
        flash[:notice] = 'Asset deleted successfully.'
        redirect_to "#{AmpleAdmin::Engine.config.mount_at}assets"
      end
    else 
      redirect_to request.referrer
    end
  end
  
  def bulk_destroy
    if params[:asset_ids]
      Asset.where(:id => params[:asset_ids]).destroy_all
      render :nothing => true
    end
  end
  
  def search
    @current_objects = model.with_query(params[:q])
    respond_with current_assets do |format|
      format.js { render :partial => 'asset', :collection => current_assets, :content_type => :html }
    end
  end

  def create
    filename, filedata = params['Filename'], params['Filedata'] 
    asset = Asset.new(:keywords => filename.gsub(/[^a-zA-Z0-9]/,' ').humanize, :attachment => filedata) 
    if asset.save
      render :partial => 'admin/assets/asset', :object => asset
    else 
      flash[:error] = "Whoops! There was a problem creating new asset."
      redirect_to :action => :index
    end
  end
  
  def update_gravity
    current_asset.update_attribute(:attachment_gravity, params[:asset][:attachment_gravity])
    render :nothing => true
  end

end