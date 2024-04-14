Rails.application.routes.draw do
  namespace :api do
    namespace :features do
      resources :earthquakes, only: [:index, :show]

      get ':feature_id/comments', to: 'comments#index'
      post '/comments/save', to: 'comments#create'
    end
  end
end
