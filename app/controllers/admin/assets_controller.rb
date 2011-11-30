class Admin::AssetsController < AdminController
  
  def index
    params[:per_page] = 100 unless params[:per_page]
    super
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
  
end
