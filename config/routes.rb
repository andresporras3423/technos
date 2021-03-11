Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'user#index'
  post '/user/create', to: 'user#create'
  post '/session/create', to: 'session#create'
  delete '/session/destroy', to: 'session#destroy'
  post '/techno/create', to: 'techno#create'
  put '/techno/update', to: 'techno#update'
end
