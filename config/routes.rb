Rails.application.routes.draw do

root             'events#index'
get    'help'    => 'static_pages#help'
get    'gallery' => 'static_pages#gallery'
get    'signup'  => 'users#new'
get    'login'   => 'sessions#new'
post   'login'   => 'sessions#create'
delete 'logout'  => 'sessions#destroy'

resources :users
resources :events
resources :artists
resources :arts

end
