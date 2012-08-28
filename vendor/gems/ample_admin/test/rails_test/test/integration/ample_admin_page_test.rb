require 'test_helper'

class AmpleAdminPageTest < ActionDispatch::IntegrationTest
  
  context 'An admin' do
    
    setup do
      @current_page = pages(:one)
      login_as users(:one)
      visit admin_path
    end
    
    should 'be able to see all pages' do
      within('nav') do
        click_link 'Pages'
      end
      assert_equal pages_path, page.current_path
      within('#left') do
        assert page.has_selector?('ul.index_list')
        assert page.has_content?( @current_page.nav_name )
      end
    end
    
    should 'be able to create a new page' do
      visit pages_path
      click_link 'Create New Page'
      assert_equal new_page_path, page.current_path
      fill_in 'Nav name', :with => 'Testing Pages'
      fill_in 'Title', :with => 'Title for My New Test Page'
      click_button 'Create Page'
      assert page.has_content?(I18n.t('ample_admin.create.success', :model => 'Page'))
    end
    
    should 'be able to edit an existing page' do
      visit pages_path
      click_link( @current_page.nav_name )
      assert_equal edit_page_path( @current_page.id ), page.current_path
      click_button 'Save Changes'
      assert page.has_content?(I18n.t('ample_admin.update.success', :model => 'Page'))
    end
    
    should 'be able to delete an existing page' do
      visit pages_path
      within("li#page_#{@current_page.id}") do
        click_link 'Delete this Page'
        confirm_dialog if selenium?
      end
      assert page.has_content?(I18n.t('ample_admin.delete.success', :model => 'Page'))
    end
    
  end

end