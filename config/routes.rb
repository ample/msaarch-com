MsaarchCom::Application.routes.draw do

  devise_for :users, :class_name => 'User', :path_prefix => '/admin'
  root :to => 'public#home'

end
