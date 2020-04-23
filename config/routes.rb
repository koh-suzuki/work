Rails.application.routes.draw do
  resources :articles
  root 'articles#index'
  
  devise_for :users, :controllers => {
     :registrations => 'users/registrations',
     :sessions => 'users/sessions',
     :passwords => 'users/passwords'
    }
end
