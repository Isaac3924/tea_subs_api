Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      resources :customers, only: [] do
        resources :subscriptions, only: %i[create index]
      end
      resources :subscriptions, only: %i[update]
    end
  end
end
