Blogger::Application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login' => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'

  root to: 'articles#index'
  resources :articles do 
    resources :comments
  end
  resources :tags do 
    resources :articles
  end
  resources :authors
end
