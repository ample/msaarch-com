require 'will_paginate/array'

class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
    
    helper_method :current_page, :current_jobs, :current_job, :careers_page, :current_careers, :contact_page
    
    def cleaned_permalink
      (params[:permalink].include?('/') ? params[:permalink].split('/').last : params[:permalink]).strip
    end

    def current_page
      @current_page ||= Page.live.find_by_permalink(cleaned_permalink)
    end

    def current_job
      @current_job ||= Job.live.find_by_permalink(cleaned_permalink)
    end

    def current_jobs
      @current_jobs ||= Job.live
    end

    def careers_page
      @careers_page ||= Page.live.find_by_template_filename('careers')
    end

    def current_careers
      @current_careers ||= Career.live
    end

    def contact_page
      @contact_page ||= Page.live.find_by_permalink 'locations'
    end

end
