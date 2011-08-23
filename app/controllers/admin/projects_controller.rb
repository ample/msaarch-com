class Admin::ProjectsController < AdminController

  set_model :project
  autocomplete :project, :title, :full => true
  
  def update 
    super
    empty_similar unless params[:project].has_key?(:similar_project_ids)
    empty_markets unless params[:project].has_key?(:market_ids)
    empty_users unless params[:project].has_key?(:user_ids)
    Market.update_project_counters
  end
  
  def destroy
    super
    Market.update_project_counters
  end

  private
  
    def empty_markets
      current_object.update_attribute :market_ids, nil 
    end

    def empty_users
      current_object.update_attribute :user_ids, nil 
    end
    
    def empty_similar
      current_object.update_attribute :similar_project_ids, nil 
    end

end
