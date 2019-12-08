Rails.application.routes.draw do
  get 'welcome/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'users/registrations', confirmations: 'users/confirmations', sessions: 'users/sessions', mailer: 'users/mailer', passwords: 'users/passwords', shared: 'users/shared', unlocks: 'users/unlocks', omniauth_callbacks: 'users/omniauth_callbacks' }


  resources :posts do
    member do
      put "like" => "posts#like"
      put "unlike" => "posts#unlike"
      # put "delete" => "posts#destroy"
    end
  end

  resources :users

  root to: 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
