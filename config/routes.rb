MsaarchCom::Application.routes.draw do

  get "users/index"

  get "users/show"

  devise_for :users, :class_name => 'User', :path_prefix => '/admin'
  root :to => 'public#home'

  scope '/admin' do
    resources :users, :controller => 'admin/users' do 
      resources :features, :controller => 'admin/features'
    end
    resources :categories, :controller => 'admin/categories' do
      collection do
        post :update_sort_order
      end
    end
    resources :projects, :controller => 'admin/projects' do
      resources :features, :controller => 'admin/features'
      collection do
        post :update_sort_order
      end
    end
    resources :markets, :controller => 'admin/markets' do
      resources :features, :controller => 'admin/features'
      member do 
        post :update_featured
      end
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
  
  resources :users, :only => [:index, :show], :path => 'team', :as => :team, :controller => 'public/users'
  match 'portfolio/:market_permalink', :to => 'public/markets#show', :as => :portfolio
  match 'portfolio/:market_permalink/:permalink', :to => 'public/projects#show', :as => :portfolio_project
  match 'index', :to => 'public#home'
  match '*permalink.:format', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :path => /.+?/, :permalink => /(?!.*?(admin)).*/ }
  match ':permalink', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :permalink => /(?!.*?(admin)).*/ }

end