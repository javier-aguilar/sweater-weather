Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :forecast
    end
  end
end
