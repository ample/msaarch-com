class Admin::UsersController < AdminController

  set_model AmpleAdmin::Engine.config.model_name.to_sym
  
  before_filter :require_admin

  def update
    params[:user].reject! { |k,v| k.include?('password') && v.blank? }
    super
  end

end