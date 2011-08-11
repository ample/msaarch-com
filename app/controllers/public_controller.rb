class PublicController < ApplicationController

  unless Rails.env.development?
   rescue_from Exception, :with => :error_message
   rescue_from ActiveRecord::RecordNotFound, :with => :file_not_found
  end

  def home
    params[:permalink] = 'index'
  end

  protected

    helper_method :current_market, :current_features

    def current_market
      @current_market ||= Market.live.find_by_permalink params[:market_permalink]
    end

    def current_features
      @current_features ||= current_page.features.live.collect{ |feature| feature if ['feature','video'].include?(feature.feature_type) }[0..4]
    end

    def error_message(e)
      HoptoadNotifier.notify(e)
      params[:permalink] = 'index'
      render :template => 'public/errors/500', :status => 500
    end

    def file_not_found
      params[:permalink] = 'index'
      render :template => 'public/errors/404', :status => 404
    end

end
