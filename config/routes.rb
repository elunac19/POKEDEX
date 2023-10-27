Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  root 'pokemons#index'

  resources :pokemons do
    collection do
      get 'next'
      get 'prev'
    end
  end

end
