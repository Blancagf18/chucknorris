Rails.application.routes.draw do
  # Cambiar la ruta raíz para que apunte a /search
  root to: "search#index"

  # Ruta para la acción search#index
  get "search", to: "search#index", as: "search_index"

  # Otras rutas
  get "up" => "rails/health#show", as: :rails_health_check
end
