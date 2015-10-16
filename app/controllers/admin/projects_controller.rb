class Admin::ProjectsController < AdminController

  set_model :project
  autocomplete :project, :title, :full => true
  
  def update 
    super
    empty_markets unless params[:project].has_key?(:market_ids)
    Market.update_project_counters
  end
  
  def destroy
    super
    Market.update_project_counters
  end

  def add_team_member
    current_project.users << current_team_member
    render :partial => 'admin/users/associated_user', :object => current_team_member, :locals => { :delete_url => remove_team_member_project_path(current_project, :user_id => current_team_member.id) }, :content_type => :html
  end

  def remove_team_member
    current_project.users.delete(current_team_member)
    render :nothing => true, :content_type => :html
  end

  def add_similar_project
    current_project.similar_projects << current_similar_project
    render :partial => 'admin/projects/associated_project', :object => current_similar_project, :locals => { :delete_url => remove_similar_project_project_path(current_project, :project_id => current_similar_project.id) }, :content_type => :html
  end

  def remove_similar_project
    current_project.similar_projects.delete(current_similar_project)
    render :nothing => true, :content_type => :html
  end

  protected 

    def get_autocomplete_items(parameters)
      model   = parameters[:model]
      term    = parameters[:term]
      method  = parameters[:method]
      options = parameters[:options]
      scopes  = Array(options[:scopes])
      limit   = get_autocomplete_limit(options)
      order   = get_autocomplete_order(method, options, model)

      items = model.all
      scopes.each { |scope| items = items.send(scope) } unless scopes.empty?

      items = items.select(get_autocomplete_select_clause(model, method, options)) unless options[:full_model]
      items = items.where(get_autocomplete_where_clause(model, term, method, options)).limit(limit).order(order)
      begin
        items.reject { |i| i == current_project || current_project.similar_projects.include?(i) }
      rescue
        items
      end
    end

  private

    def current_market
      @current_market ||= Market.find_by_permalink params[:market_filter]
    end

    def current_projects
      per_page = params[:per_page] || 15
      if params[:market_filter]
        projects = current_market.projects.order(:title).paginate(:page => params[:page], :per_page => per_page)
      else
        projects = Project.all.order(:title).paginate(:page => params[:page], :per_page => per_page)
      end
      @current_projects ||= projects
    end

    def empty_markets
      current_object.update_attribute :market_ids, nil 
    end

    def empty_users
      current_object.update_attribute :user_ids, nil 
    end

    def current_similar_project
      @current_similar_project ||= Project.find(params[:project_id])
    end

    def current_team_member
      @current_team_member ||= User.find(params[:user_id])
    end

end
