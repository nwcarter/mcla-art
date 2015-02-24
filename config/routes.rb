Rails.application.routes.draw do
 
root             'static_pages#home'
get 'help'    => 'static_pages#help'
get 'event'   => 'static_pages#event'
get 'gallery' => 'static_pages#gallery'
get 'signup'  => 'users#new'

resources :users

end
