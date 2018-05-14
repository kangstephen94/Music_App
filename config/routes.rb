Rails.application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resources :bands do
    resources :albums 
  end
  resource :session, only: [:new, :create, :destroy]

  root to: redirect('/session/new')
end
