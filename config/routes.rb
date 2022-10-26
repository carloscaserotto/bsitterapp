Rails.application.routes.draw do
  root 'welcome#home'

  resources :users, except: [:new, :create]
  
  resources :articles do
    member do
      delete :delete_file
    end
  end
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
