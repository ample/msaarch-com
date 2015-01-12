class PublicController < ApplicationController

  caches_page :home

  unless Rails.env.development?
   rescue_from Exception, :with => :error_message
   rescue_from ActiveRecord::RecordNotFound, :with => :file_not_found
  end

  def home
    params[:permalink] = 'index'
  end

  protected

    helper_method :current_market, :current_features, :current_updates

    def current_market
      @current_market ||= Market.live.find_by_permalink params[:market_permalink]
    end

    def current_features
      @current_features ||= current_page.features.live.collect{ |feature| feature if ['feature','video'].include?(feature.feature_type) }
      if params[:action] == 'home'
        @current_features.reject{ |f| f == current_page.videos.first }.compact[0..4]
      else
        @current_features.compact[0..4]
      end
    end

    def current_updates
      @current_updates ||= Update.live.order('created_at DESC').limit(2)
    end

    def error_message(e)
      HoptoadNotifier.notify(e)
      params[:permalink] = 'index'
      render :template => 'public/errors/500', :status => 500, :layout => 'application'
    end

    def file_not_found
      params[:permalink] = 'index'
      render :template => 'public/errors/404', :status => 404, :layout => 'application'
    end

end
