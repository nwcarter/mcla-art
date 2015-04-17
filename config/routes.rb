Rails.application.routes.draw do

root                 'events#index'
get    'events'   => 'events#list'
get    'artists'  => 'artists#index'
get    'arts'     => 'arts#index'
get    'help'     => 'static_pages#help'
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
