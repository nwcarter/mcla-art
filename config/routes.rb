Rails.application.routes.draw do
 
  get 'users/new'

root             'static_pages#home'
get 'help'    => 'static_pages#help'
get 'event'   => 'static_pages#event'

end
