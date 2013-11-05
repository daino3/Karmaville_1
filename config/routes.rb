Karmaville::Application.routes.draw do
  resources :users, :only => [:index]

  root :to => 'users#index'


  get '/users/:id' => 'users#move'
end
