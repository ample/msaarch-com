class Admin::ProjectsController < AdminController

  set_model :project
  
  def update 
    super
    Market.update_project_counters
  end
  
  def destroy
    super
    Market.update_project_counters
  end

end
