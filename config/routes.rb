Rails.application.routes.draw do

  devise_for :users
  root "subjects#index"

  resources :subjects do
    resources :posts do
      member do
        put "like", to: "posts#upvote"
      end
    end
  end

  namespace :account do
    resources :posts
  end

end
