Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'user/signup', to: 'users#signup'
  post 'user/signin', to: 'users#login'
  get 'categories', to: 'categories#list'
  get 'ad/list', to: 'ads#ads'
  #get 'ad/list', to: 'ads#index'
  get 'user/me', to: 'users#me'
  get 'states', to: 'states#list'

  post 'ad/add', to: 'ads#create'
  # get 'ad/list', to: 'ads#index'
end
