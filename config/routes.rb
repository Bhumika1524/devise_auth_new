Rails.application.routes.draw do
  root to: 'posts#index'
  devise_for :users
  resources :posts do
    resources :comments
  end
  # get '/:id/comment/new', to: 'posts#new_comment', as: 'new_comment'
  # post '/:id/comment', to: 'posts#create_comment'
  # get '/:id/comment/:id/edit', to: 'posts#edit_comment', as: 'edit_comment'
  # put '/:id/comment/:id', to: 'posts#update_comment'
  # patch '/:id/comment/:id', to: 'posts#update_comment'
  # get '/comment/:id', to: 'posts#destroy_comment', as: 'destroy_comment'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
