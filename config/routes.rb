Rails.application.routes.draw do
  resources :places
  root 'places#index'

  resources :api do
    collection do
      get 'get_nearby_places'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
