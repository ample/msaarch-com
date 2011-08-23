MsaarchCom::Application.routes.draw do

  get "careers/index"

  get "careers/show"

  get "careers/new"

  devise_for :users, :class_name => 'User', :path_prefix => '/admin'
  root :to => 'public#home'

  scope '/admin' do
    match 'news', :to => 'admin/news#index'
    resources :careers, :controller => 'admin/careers' do
      collection do
        post :update_sort_order
      end
    end
    resources :posts, :controller => 'admin/posts', :path => 'news/posts' do 
      resources :features, :controller => 'admin/features'
    end
    resources :updates, :controller => 'admin/updates', :path => 'news/updates'
    resources :awards, :controller => 'admin/awards' do
      collection do
        post :update_sort_order
      end
    end
    resources :events, :controller => 'admin/events' do
      collection do
        post :update_sort_order
      end
    end
    resources :users, :controller => 'admin/users', :path => 'team' do 
      resources :features, :controller => 'admin/features'
      member do 
        post :add_favorite_project
        delete :remove_favorite_project
      end
    end
    resources :categories, :controller => 'admin/categories' do
      collection do
        post :update_sort_order
      end
    end
    resources :projects, :controller => 'admin/projects' do
      resources :features, :controller => 'admin/features'
      member do 
        post :add_similar_project
        delete :remove_similar_project
        get :autocomplete_project_title
      end
      collection do
        post :update_sort_order
        get :autocomplete_project_title
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
  
  match 'team/history', :to => 'public/users#history', :as => :history
  resources :users, :only => [:index, :show], :path => 'team', :as => :team, :controller => 'public/users'
  resources :careers, :only => [:create], :path => 'contact/email', :controller => 'public/careers'

  match 'contact', :to => 'public/careers#index', :as => :contact
  match 'contact/email(/:id)', :to => 'public/careers#new', :as => :contact_form
  match 'contact/:permalink', :to => 'public/careers#show', :as => :public_career
  match 'news', :to => 'public/news#index', :as => :public_news
  match 'news/awards', :to => 'public/news#awards', :as => :public_awards
  match 'news/archive', :to => 'public/news#archive', :as => :public_news_archive
  match 'news/:permalink', :to => 'public/news#show', :as => :public_post
  match 'news/:permalink/print', :to => 'public/news#print', :as => :public_post_print
  match 'portfolio/:market_permalink', :to => 'public/markets#show', :as => :portfolio
  match 'portfolio/:market_permalink/:permalink', :to => 'public/projects#show', :as => :portfolio_project
  match 'index', :to => 'public#home'
  match '*permalink.:format', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :path => /.+?/, :permalink => /(?!.*?(admin)).*/ }
  match ':permalink', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :permalink => /(?!.*?(admin)).*/ }

end