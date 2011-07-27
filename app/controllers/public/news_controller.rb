class Public::NewsController < ApplicationController

  def index
    params[:permalink] = 'news'
  end

  def show
  end

  def archive
  end

  protected 
  
    helper_method :latest_updates, :latest_posts, :archived_posts

    def latest_updates
      @latest_updates ||= Update.live.limit(4).order('created_at DESC')
    end

    def latest_posts
      @latest_posts ||= Post.live.limit(6).order('created_at DESC')
    end

    def archived_posts
      @archived_posts ||= Post.live.order('created_at DESC').group_by { |post| post.created_at.beginning_of_month }
    end

end
