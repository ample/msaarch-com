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

  def add_similar_project
    current_project.similar_projects << current_similar_project
    render :partial => 'admin/projects/similar_project', :object => current_similar_project, :locals => { :delete_url => remove_similar_project_project_path(current_project, :project_id => current_similar_project.id) }, :content_type => :html
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

      items = model.scoped
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

    def empty_markets
      current_object.update_attribute :market_ids, nil 
    end

    def empty_users
      current_object.update_attribute :user_ids, nil 
    end

    def empty_similar
      current_object.update_attribute :similar_project_ids, nil 
    end

    def current_similar_project
      @current_similar_project ||= Project.find(params[:project_id])
    end

end
