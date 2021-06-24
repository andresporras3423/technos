Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'user/index', to: 'user#index'
  post '/user/create', to: 'user#create'
  post '/session/create', to: 'session#create'
  delete '/session/destroy', to: 'session#destroy'
  post '/techno/create', to: 'techno#create'
  put '/techno/update', to: 'techno#update'
  get '/techno/get', to: 'techno#get'
  post '/techno/search', to: 'techno#search'
  delete '/techno/delete', to: 'techno#delete'
  get '/pokemon/get', to: 'pokemon#get'
  get '/pokemon/get_names_types', to: 'pokemon#get_names_types'
  get '/pokemon/get_details', to: 'pokemon#get_details'
  post '/word/create', to: 'word#create'
  put '/word/update', to: 'word#update'
  get '/word/get', to: 'word#get'
  post '/word/search', to: 'word#search'
  post '/word/next_question', to: 'word#next_question'
  post '/word/next_practice', to: 'word#next_practice'
  delete '/word/delete', to: 'word#delete'
  get '/test/get', to: 'test#get'
  post '/test/create', to: 'test#create'
end
