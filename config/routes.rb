Rails.application.routes.draw do
  devise_for :users

  resources :billboards do
    resources :artists
  end

  resources :artists do
    resources :songs
  end

end
