Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: %i[new create]
  end
  root 'cocktails#index'
  delete '/doses/:id', to: 'doses#destroy', as: :dose
end
