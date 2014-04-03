class Public::NewsController < ApplicationController

  caches_page :show, :index
  layout :which_layout

  def index
    params[:permalink] = 'news'
  end

  def show
    raise ActiveRecord::RecordNotFound if current_post.nil?
    respond_to do |format|
      format.html do
        @page_title = META[:page_title]
        @page_title = "#{current_post.title} | #{@page_title}"
        @meta_description = html_escape(current_post.body.gsub(/\n/, "").truncate(130))
      end
      format.pdf do
        send_data PDFKit.new(public_post_url(current_post.permalink)).to_pdf,
          :filename => "#{current_post.permalink}.pdf", :type => 'application/pdf', :stream => false
      end
    end
  end

  def print
    raise ActiveRecord::RecordNotFound if current_post.nil?
    if params[:format] == 'pdf'
      redirect_to "/about/news/#{params[:permalink]}/print"
    else
      @page_title = META[:page_title]
      render :template => 'public/news/show'
    end
  end

  def archive
  end

  def awards
    params[:permalink] = 'awards'
  end

  protected

    helper_method :latest_updates, :latest_posts, :archived_posts, :current_post, :current_awards

    def current_post
      @current_post ||= Post.live.find_by_permalink params[:permalink]
    end

    def latest_updates
      @latest_updates ||= Update.live.limit(4).order('created_at DESC')
    end

    def latest_posts
      if current_post.nil?
        @latest_posts ||= Post.live.limit(6).order('created_at DESC')
      else
        @latest_posts ||= Post.live.limit(6).order('created_at DESC').reject{ |post| post==current_post }
      end
    end

    def archived_posts
      @archived_posts ||= Post.live.order('created_at DESC').group_by { |post| post.created_at.beginning_of_month }
    end

    def current_awards
      @current_awards ||= Award.live.order('awarded_date DESC').group_by { |award| award.awarded_date.beginning_of_month }
    end

    def which_layout
      pdfkit? || params[:action] == 'print' ? 'pdf' : 'application'
    end

    def pdfkit?
      request.env['HTTP_USER_AGENT'].include?('PDFKit') || request.format.pdf? rescue nil?
    end

end
