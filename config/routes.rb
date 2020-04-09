Rails.application.routes.draw do
  root "memos#index"
  resources :memos, param: :id
  resources :memos do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#destroy'
  end
  get 'search' => 'memos#search'
  get 'tag' => 'memos#tag'
  get 'freemarket' => 'tags#show'
  get 'tag_edit' => 'memos#tag_edit'
  resources :tags
  
  resource :user,path: '/mypage/' do
      get 'profile',on: :collection
  end

  resources :apples do
    get 'dropimages',on: :collection
    get 'dropzone',on: :collection
end

  resources :tests

  resources :images, only: [:index, :create, :show]
  root "images#index"

  

  resource :favorites , only: [:show]
  resource :notes , only: [:index, :new, :show, :create]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
