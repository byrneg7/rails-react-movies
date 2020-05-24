Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :movies, :chatrooms
    end
  end
end