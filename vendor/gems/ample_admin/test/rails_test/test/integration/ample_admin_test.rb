require 'test_helper'

class AmpleAdminTest < ActionDispatch::IntegrationTest
  
  context 'An admin' do
    
    setup do
      Capybara.reset_sessions!
    end
    
    teardown do
      logout
      Warden.test_reset!
    end
    
    should 'be able to logout' do
      login_as users(:one)
      visit admin_path
      click_link 'Sign Out'
      assert_equal root_path, page.current_path
    end
    
    should 'be able to login' do
      visit admin_path
      assert_equal new_user_session_path, page.current_path
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Password', :with => 'ample2011'
      click_button 'Sign in'
      assert page.has_content?('Signed in successfully')
      assert_equal admin_path, page.current_path
    end
    
  end

end