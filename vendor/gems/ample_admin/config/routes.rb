Rails.application.routes.draw do

  mount_at = AmpleAdmin::Engine.config.mount_at
  scope mount_at do
    resources :pages, :controller => 'admin/pages' do 
      resources :features, :controller => 'admin/features'
      collection do
        post :update_sort_order
      end
    end
    resources :features, :controller => 'admin/features' do
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
        post :update_gravity
      end
    end
  end
  get mount_at => 'admin#dashboard'

end
