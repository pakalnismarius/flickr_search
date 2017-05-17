Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "search#index"

  post "/", to: "search#search_result", as: "search"
end
