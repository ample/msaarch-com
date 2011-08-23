class Admin::UsersController < AdminController
  
  def create
    params[:user].reject! { |k,v| k.include?('password') && v.blank? }
    super
  end

  def update
    params[:user].reject! { |k,v| k.include?('password') && v.blank? }
    super
    empty_favorites unless params[:user].has_key?(:favorite_ids)
    empty_expertise unless params[:user].has_key?(:expertise_ids)
  end

  def add_favorite_project
    current_object.favorites << current_favorite_project
    render :partial => 'admin/projects/associated_project', :object => current_favorite_project, :locals => { :delete_url => remove_favorite_project_user_path(current_object, :project_id => current_favorite_project.id) }, :content_type => :html
  end

  def remove_favorite_project
    current_object.favorites.delete(current_favorite_project)
    render :nothing => true, :content_type => :html
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

    def current_favorite_project
      @current_favorite_project ||= Project.find(params[:project_id])
    end

end
