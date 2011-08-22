class AddHumanizedTitleToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :keywords, :string
    Asset.all.each do |asset|
      asset.update_attribute :keywords, asset.attachment_name.gsub(/[^a-zA-Z0-9]/,' ').humanize
    end
  end
end
