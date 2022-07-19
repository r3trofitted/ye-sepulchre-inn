Rails.application.routes.draw do
  resources :games, only: :show do
    get "join", to: "players#create", as: "join"
    delete "leave", to: "players#delete", as: "leave"
    resources :players, only: [:create, :delete]
  end
end
