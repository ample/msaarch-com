class Admin::UsersController < AdminController
  
  def create
    params[:user].reject! { |k,v| k.include?('password') && v.blank? }
    super
  end

  def update
    params[:user].reject! { |k,v| k.include?('password') && v.blank? }
    super
    empty_projects unless params[:user].has_key?(:project_ids)
    empty_favorites unless params[:user].has_key?(:favorite_ids)
    empty_expertise unless params[:user].has_key?(:expertise_ids)
  end

  protected 

    helper_method :current_admin_users, :current_staff_users

    def current_admin_users
      per_page = params[:per_page] || 15
      User.all.collect{ |user| user if user.admin? }.compact.paginate(:page => params[:admin_users_page], :per_page => per_page)
    end

    def current_staff_users
      per_page = params[:per_page] || 15
      User.all.paginate(:page => params[:staff_users_page], :per_page => per_page)
    end

  private 

    def empty_projects
      current_object.update_attribute :project_ids, nil 
    end

    def empty_favorites
      current_object.update_attribute :favorite_ids, nil 
    end

    def empty_expertise
      current_object.update_attribute :expertise_ids, nil 
    end

end
