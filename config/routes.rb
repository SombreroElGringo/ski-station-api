Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    namespace :v1 do
      resources :stations, param: :code
      get "stations/scraper/:key" => "stations#scraper"
      resources :stations
      get "stations/ski/tops" => "stations#tops"
    end
  end
  get "*path", to: redirect('/')
end
