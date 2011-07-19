MsaarchCom::Application.routes.draw do

  devise_for :users, :class_name => 'User', :path_prefix => '/admin'
  root :to => 'public#home'

  scope '/admin' do
    resources :categories, :controller => 'admin/categories' do
      collection do
        post :update_sort_order
      end
    end
    resources :projects, :controller => 'admin/projects' do
      collection do
        post :update_sort_order
      end
    end
    resources :segments, :controller => 'admin/segments' do
      collection do
        post :update_sort_order
      end
    end
  end

  match 'index', :to => 'public#home'
  match '*permalink.:format', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :path => /.+?/, :permalink => /(?!.*?(admin)).*/ }
  match ':permalink', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :permalink => /(?!.*?(admin)).*/ }

end
