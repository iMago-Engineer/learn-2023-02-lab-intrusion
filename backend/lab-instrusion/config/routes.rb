Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'questions/random', action: :random, controller: 'questions'
  resources :questions, only: [:index, :create, :show] do
    resources :trials, only: [:index], controller: 'questions/trials'
  end

  resources :trials, only: [:create]
end
