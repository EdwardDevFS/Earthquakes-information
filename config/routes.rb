Rails.application.routes.draw do
  namespace :api do
    namespace :features do
      resources :earthquakes, only: [:index, :show]
    end
  end
end
