Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root "search#index"
  root "search#index"
  get "/result", to: "search#result", as: "search_result"
  post "/", to: "search#search_result", as: "search"
end
