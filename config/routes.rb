Rails.application.routes.draw do
  match '/api/v1/gps' => 'places#save_place', via: :post
  scope :api do
    resources :places, only: [:index]
  end
end