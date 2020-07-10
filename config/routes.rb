Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails, except: :index do
    resources :doses, only: %i[new create]
    member do
      patch 'cubes'
    end
  end
  root 'cocktails#index'
  delete '/doses/:id', to: 'doses#destroy', as: :dose
  get '/search', to: 'cocktails#search', as: :search
end
