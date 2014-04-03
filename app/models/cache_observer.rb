class CacheObserver < ActiveRecord::Observer

  observe :award, :career, :category, :event, :feature, :market, :organization, :page, :post, :project, :projectship, :update

  def after_save(obj)
    expire_cache
  end

  def after_destroy(obj)
    expire_cache
  end

  protected

    def expire_cache
      cache_path = ActionController::Base.page_cache_directory
      FileUtils.rm_rf Dir.glob("#{cache_path}/*")
      ActionController::Base.cache_store.clear
    end

end
