Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', sessions: 'sessions' }

  root 'home#index'

  resources :user_profiles, only: [:edit]

  post 'user_profiles/:id' => 'user_profiles#update', as: 'update_user_profile'
end
