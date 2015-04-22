Rails.application.routes.draw do

root                 'events#index'
get    'about'    => 'static_pages#about'
get    'contact'  => 'static_pages#contact'
get    'events'   => 'events#list'
get    'artists'  => 'artists#index'
get    'arts'     => 'arts#index'
get    'gallery'  => 'arts#gallery'
get    'signup'   => 'users#new'
get    'login'    => 'sessions#new'
post   'login'    => 'sessions#create'
delete 'logout'   => 'sessions#destroy'
get 'get_artists' => 'artists#get_ajax'
get 'get_artwork' => 'arts#get_ajax'


resources :users
resources :events
resources :artists
resources :arts

end
