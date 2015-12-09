MsaarchCom::Application.routes.draw do
#
  devise_for :users, :class_name => 'User', :path_prefix => '/admin'
  root :to => 'public#home'

  scope '/admin' do
    get 'news', :to => 'admin/news#index'
    get 'team/update_sort_order', :to => 'admin/users#update_sort_order'
    resources :careers, :controller => 'admin/careers' do
      collection do
        post :update_sort_order
      end
    end
    resources :posts, :controller => 'admin/posts', :path => 'news/posts' do 
      resources :features, :controller => 'admin/features'
    end
    resources :updates, :controller => 'admin/updates', :path => 'news/updates'
    resources :organizations, :controller => 'admin/organizations'
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
      collection do 
        get :autocomplete_user_first_name
      end
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
      collection do
        post :update_sort_order
        get :autocomplete_project_title
      end
      member do 
        post :add_team_member
        post :add_similar_project
        delete :remove_team_member
        delete :remove_similar_project
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
      collection do
        post :search
        post :bulk_destroy
      end
      member do
        post :update
      end
    end
  end
  
  get 'team/overview', :to => 'public/users#index', :as => :team_index
  get 'team/history', :to => 'public/users#history', :as => :history
  resources :users, :only => :show, :path => 'team/staff', :as => :team, :controller => 'public/users'
  resources :careers, :only => [:create], :path => 'contact/email', :controller => 'public/careers'

  get 'contact', :to => 'public/careers#index', :as => :contact
  get 'contact/email(/:id)', :to => 'public/careers#new', :as => :contact_form
  get 'careers/:permalink', :to => 'public/careers#show', :as => :public_career
  get 'about/news', :to => 'public/news#index', :as => :public_news
  get 'about/awards', :to => 'public/news#awards', :as => :public_awards
  get 'about/news/archive', :to => 'public/news#archive', :as => :public_news_archive
  get 'about/news/:permalink', :to => 'public/news#show', :as => :public_post
  get 'about/news/:permalink/print', :to => 'public/news#print', :as => :public_post_print
  get 'portfolio/:market_permalink', :to => 'public/markets#show', :as => :portfolio
  get 'portfolio/:market_permalink/:permalink', :to => 'public/projects#show', :as => :portfolio_project
  get 'index', :to => 'public#home'
  get '*permalink.:format', :to =>  'public/pages#show', :as => 'formatted_public_page', :constraints => { :path => /.+?/, :permalink => /(?!.*?(admin)).*/ }
  get ':permalink', :to =>  'public/pages#show', :as => 'public_page', :constraints => { :permalink => /(?!.*?(admin)).*/ }

end
