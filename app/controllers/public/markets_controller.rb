class Public::MarketsController < PublicController

  def show
    raise ActiveRecord::RecordNotFound if current_market.nil?
  end

end
