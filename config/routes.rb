Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :stations, param: :code
    end
  end
end
