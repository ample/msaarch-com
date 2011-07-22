class Admin::MarketsController < AdminController

  set_model :market
  
  def update_featured
    projectship_ids = params[:featured_projectship_ids].try(:keys) || []
    Projectship.update_all({:featured => false})
    Projectship.update_all({:featured => true}, {:id => projectship_ids})
    render :nothing => true
  end
  
end
