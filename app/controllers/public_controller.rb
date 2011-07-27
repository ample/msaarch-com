class PublicController < ApplicationController

  def home
    params[:permalink] = 'index'
  end

  private

    helper_method :current_market, :current_features

    def current_market
      @current_market ||= Market.live.find_by_permalink params[:market_permalink]
    end

    def current_features
      @current_features ||= current_page.features.live.collect{ |feature| feature if ['feature','video'].include?(feature.feature_type) }[0..4]
    end

end
