class Public::NewsController < ApplicationController

  def index
    params[:permalink] = 'news'
  end

  def show
  end

  def archive
  end

  def awards
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
      if current_post.nil?.to_yaml
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

end
