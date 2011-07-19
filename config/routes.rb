MsaarchCom::Application.routes.draw do

  devise_for :users, :class_name => 'User', :path_prefix => '/admin'
  root :to => 'public#home'

  #match '*permalink.:format', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :path => /.+?/ }
  match ':permalink', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :permalink => /(?!.*?(admin)).*/ }

end
