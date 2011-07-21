class Admin::CategoriesController < AdminController

  set_model :category

  protected
  
    helper_method :current_categories
    
    def current_categories
      @current_categories ||= Category.root_level
    end

end