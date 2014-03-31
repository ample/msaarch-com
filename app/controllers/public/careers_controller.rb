class Public::CareersController < PublicController

  include ActionView::Helpers::TextHelper

  caches_page :index, :show
  before_filter :set_permalink, :except => :show

  def index
  end

  def show
    raise ActiveRecord::RecordNotFound if current_career.nil? && current_page.nil?
    if current_page
      respond_to do |format|
        format.html do
          @page_title = META[:page_title]
          @page_title = "#{current_page.nav_name} | #{@page_title}"
          @meta_keywords = current_page.meta_keywords
          @meta_description = current_page.meta_description
          render :template => current_page.template.view_path
        end
      end
    end
  end

  def new
    params[:message] = { :to_id => params[:id] } if params[:message].nil?
    @message = Message.new params[:message]
  end

  def create
    @message = Message.new params[:message]
    if @message.save
      Notifier.contact_notification(@message).deliver if @message.valid?
      flash[:notice] = 'Thanks! Your message was received successfully and will be forward on to the appropriate person.'.html_safe
      redirect_to :action => :new
    else
      flash.now[:error] = pluralize(@message.errors.count, "error") + ' prohibited this email from being sent.'
      render :action => :new
    end
  end

  protected

    helper_method :current_careers, :current_career, :market_experts, :contact_page

    def current_careers
      @current_careers ||= Career.live
    end

    def current_career
      @current_career ||= Career.live.find_by_permalink params[:permalink]
    end

    def set_permalink
      params[:permalink] = 'locations'
    end

    def contact_page
      @contact_page ||= Page.live.find_by_permalink 'locations'
    end

end
