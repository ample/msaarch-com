require 'test_helper'

class AssetTest < ActionDispatch::IntegrationTest

  context 'An admin' do

    setup do
      @asset = create_asset
      @admin = create_user(:admin => true)
      login_as @admin
    end

    should 'be able to edit keywords and color for a given asset' do
      visit thing_path(@asset)
      assert_equal "/admin/assets/#{@asset.id}", page.current_path
      fill_in 'Keywords', :with => 'testing'
      fill_in 'Color', :with => '#123456'
      click_button 'Update Asset'
      visit thing_path(@asset)
      assert_equal find_field('Keywords').value, 'testing'
      assert_equal find_field('Color').value, '#123456'
    end

  end

end
