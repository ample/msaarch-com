class Admin::AssetsController < AdminController

  def show
    render :file => "admin/assets/show", :layout => 'vanilla'
  end
  
  def update_color
    current_asset.update_attribute(:color, params[:asset][:color])
    render :nothing => true
  end
  
end