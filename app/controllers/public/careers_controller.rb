class Public::CareersController < PublicController

  def index
    params[:permalink] = 'contact'
  end

  def show
    raise ActiveRecord::RecordNotFound if current_career.nil?
    params[:permalink] = 'contact'
  end

  def new
    @message = Message.new params[:message]
  end

  protected 

    helper_method :current_careers, :current_career, :market_experts

    def current_careers
      @current_careers ||= Career.live
    end

    def current_career
      @current_career ||= Career.live.find_by_permalink params[:permalink]
    end

end
