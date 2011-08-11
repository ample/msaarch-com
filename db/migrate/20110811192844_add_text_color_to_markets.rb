class AddTextColorToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :text_color, :string
    Market.all.each do |market|
      market.update_attribute :text_color, market.color
    end
  end
end
