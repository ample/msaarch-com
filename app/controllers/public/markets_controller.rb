class Public::MarketsController < PublicController

  caches_page :show

  def show
    raise ActiveRecord::RecordNotFound if current_market.nil?
    @page_title = META[:page_title]
    @page_title = "#{current_market.nav_name} | #{@page_title}"
    @meta_description = current_market.body.truncate(135)
  end

end
