class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def after_update(post)
    expire_cache_for(post)
  end

  def after_destroy(post)
    expire_cache_for(post)
  end

  private
  
    def expire_cache_for(post)
      # Only expire the pdf
      expire_page("/news/#{post.permalink}.pdf")
    end
    
end