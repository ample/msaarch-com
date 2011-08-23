class Admin::MarketsController < AdminController

  set_model :market
  
  def update_featured
    #raise current_market.to_yaml
    projectship_ids = params[:featured_projectship_ids].try(:keys) || []
    Projectship.update_all({:featured => false}, {:owner_id => current_market.id, :owner_type => 'Market' })
    Projectship.update_all({:featured => true}, {:id => projectship_ids, :owner_id => current_market.id, :owner_type => 'Market' })
    render :nothing => true
  end
  
end
