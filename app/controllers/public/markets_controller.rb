class Public::MarketsController < ApplicationController

  def show
  end

  private
  
    helper_method :current_market
  
    def current_market
      @current_market ||= Market.live.find_by_permalink params[:permalink]
    end

end
