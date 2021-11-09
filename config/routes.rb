Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :customers, only: [:create, :destroy, :show] do
        resources :customer_subscriptions, only: [:index, :create]
      end
    end
  end
end
