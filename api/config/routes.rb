Rails.application.routes.draw do
  namespace :v1 do
    mount_devise_token_auth_for 'User', at: 'auth', controllers: {
      registrations: 'v1/auth/registrations'
    }
  end
  namespace :v1 do
    resources :users, only: %i[show update index]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
