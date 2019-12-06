Rails.application.routes.draw do
  root 'billboards#index'

  devise_for :users

  resources :billboards do
    resources :artists
  end

  resources :artists do
    resources :songs
  end

end
