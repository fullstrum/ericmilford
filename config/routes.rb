Ericmilford::Application.routes.draw do
  root to: 'articles#index'

  resources :articles, only: [:index] do
    collection do
      match 'page/:page', action: :index
    end
  end
end
