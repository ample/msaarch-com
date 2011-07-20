MsaarchCom::Application.routes.draw do

  get "segments/index"

  get "projects/show"

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
    resources :assets, :as => 'things', :controller => 'admin/assets' do 
      member do 
        post :update_color
      end
      collection do 
        post :search
      end
    end
  end

  match 'portfolio/:permalink', :to => 'public/segments#show', :as => :portfolio
  match 'index', :to => 'public#home'
  match '*permalink.:format', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :path => /.+?/, :permalink => /(?!.*?(admin)).*/ }
  match ':permalink', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :permalink => /(?!.*?(admin)).*/ }

end