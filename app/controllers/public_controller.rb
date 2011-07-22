class PublicController < ApplicationController

  def home
    params[:permalink] = 'index'
  end

  private

    helper_method :current_market

    def current_market
      @current_market ||= Market.live.find_by_permalink params[:market_permalink]
    end

end
