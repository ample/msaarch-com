class AdminController < ApplicationController
  
  layout 'admin'
  before_filter :authenticate_user!
  
  respond_to :html, :js, :only => :search
  
  def dashboard
  end
  
  def index
    per_page = params[:per_page] || 15
    unless per_page.nil?
      begin
        @current_objects = model.all.paginate(:page => params[:page], :per_page => per_page)
      rescue
      end
    end
  end

  def new
    @current_object = model.new
    setup_blocks if current_object.respond_to?(:template_filename)
  end
  
  def create
    @current_object = model.new(object_params)
    if current_object.save
      flash[:notice] = I18n.t('ample_admin.create.success', :model => self.class.model_sym.to_s.titleize)
      conditional_continue
    else
      flash[:error] = I18n.t('ample_admin.create.failure', :model => self.class.model_sym.to_s.titleize)
      render :action => :new
    end
  end
  
  def edit
    setup_blocks if current_object.respond_to?(:template_filename)
  end
  
  def update
    if current_object.update_attributes(object_params)
      flash[:notice] = I18n.t('ample_admin.update.success', :model => self.class.model_sym.to_s.titleize)
      conditional_continue
    else
      flash[:error] = I18n.t('ample_admin.update.failure', :model => self.class.model_sym.to_s.titleize)
      render :action => :edit
    end
  end
  
  def destroy
    if current_object.destroy
      flash[:notice] = I18n.t('ample_admin.delete.success', :model => self.class.model_sym.to_s.titleize)
    end
    redirect_to :action => :index
  end
  
  # Called by Ajax method
  def search
    @current_objects = model.with_query(params[:q])
    respond_with current_objects do |format|
      format.js { render :partial => 'search_results', :locals => { :search_results => current_objects } }
    end
  end
  
  # Called by Ajax method to update sorting
  def update_sort_order
    #logger.debug "sortable_list: #{params[:sortable_list]}"
    params[:sortable_list].each_with_index do |id, position|
      model.update(id, :sort_order => position)
    end
    render :nothing => true
  end
  
  protected
    
    helper_method :recent_assets, :current_object, :current_objects, :model
    
    def recent_assets
      @recent_assets ||= Asset.recent.limit(12)
    end

    def require_admin
      redirect_to admin_path, :notice => I18n.t('ample_admin.restricted') unless current_user.admin?
    end
    
    def set_current_user
      UserObserver.current_user = current_user
    end
  
    # Abstraction Instance Methods
  
    def current_object
      @current_object ||= model.find(params[:id])
    end
  
    def current_objects
      @current_objects ||= model.all
    end
  
    def model
      @model ||= "#{self.class.model_sym.to_s.camelize}".constantize
    end
    
    def conditional_continue(return_url = nil, continue_url = nil)
      if params[:continue]
        url = continue_url || eval("edit_#{self.class.model_sym.to_s}_path(current_object)")
      else
        url = return_url || eval("#{self.class.model_sym.to_s.pluralize}_path")
      end
      redirect_to url
    end
    
    # Abstraction Class Methods
    
    def self.set_model(model_symbol)
      @model_sym = model_symbol
      alias_method "current_#{@model_sym}", "current_object" unless @model_sym == :user
      alias_method "current_#{@model_sym.to_s.pluralize}", "current_objects"
      eval "helper_method :current_#{@model_sym}, :current_#{@model_sym.to_s.pluralize}"
    end
    
    def self.model_sym
      @model_sym
    end
    
    # Template Setup Methods

    def setup_blocks
      hash_key = model.to_s.pluralize.underscore.sub('ample_admin/', '').to_sym
      current_object.template_filename ||= AmpleAdmin::Engine.config.templates[hash_key][:default]
      new_blocks = current_object.template.fields.collect do |f|
        current_object.blocks.detect { |b| f[0] == b.name && f[1] == b.block_type } || current_object.blocks.build(:name => f[0], :block_type => f[1])
      end
      current_object.blocks = new_blocks
    end

    def object_params
      params.require(self.class.model_sym).permit!
    end

end
