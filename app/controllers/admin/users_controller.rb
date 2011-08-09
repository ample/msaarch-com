class Admin::UsersController < AdminController

  protected 

    helper_method :current_admin_users, :current_staff_users

    def current_admin_users
      per_page = params[:per_page] || 15
      User.all.collect{ |user| user if user.admin? }.compact.paginate(:page => params[:page], :per_page => per_page)
    end

    def current_staff_users
      per_page = params[:per_page] || 15
      User.all.paginate(:page => params[:page], :per_page => per_page)
    end

end
