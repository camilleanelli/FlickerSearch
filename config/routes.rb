Rails.application.routes.draw do
  get 'search/index'

get "/search" => "search#index"

end
