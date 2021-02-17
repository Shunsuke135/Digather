Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :playlists do
   resource :favorites, only: [:create, :destroy]
   resources :playlist_comments, only: [:create, :destroy]
  resources :songs, only: [:new, :create, :destroy]
 end

 get '/search' => 'search#search'


end
