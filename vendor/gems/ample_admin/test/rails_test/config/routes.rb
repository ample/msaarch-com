RailsTest::Application.routes.draw do

  devise_for :users, :class_name => 'User', :path_prefix => '/admin'
  root :to => "home#index"

end
