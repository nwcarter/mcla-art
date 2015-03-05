Rails.application.routes.draw do

root             'static_pages#home'
get    'help'    => 'static_pages#help'
get    'event'   => 'static_pages#event'
get    'gallery' => 'static_pages#gallery'
get    'edit'    => 'static_pages#edit_events'
get    'edit_event'    => 'static_pages#edit_event'
get    'signup'  => 'users#new'
get    'login'   => 'sessions#new'
post   'login'   => 'sessions#create'
delete 'logout'  => 'sessions#destroy'


resources :users

end
