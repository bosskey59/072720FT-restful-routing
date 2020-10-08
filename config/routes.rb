Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# # index
# get '/sushis', to:"sushis#index"
# # new
# get '/sushis/new', to:"sushis#new"
# # show
# get '/sushis/:id', to:"sushis#show", as: "sushi"
# # create
# post '/sushis', to:"sushis#create"
# # edit
# get '/sushis/:id/edit', to:'sushis#edit', as: "edit_sushi"
# # update
# patch '/sushis/:id', to:'sushis#update'
# # destroy
# delete '/sushis/:id', to:'sushis#destroy'
get '/sushis/search', to:'sushis#search'
post '/search', to:'sushis#results'
resources :sushis do
  resources :ingredients
end

resources :ingredients
# get '/ingredients', to: 'ingredients#index'
# get '/sushis/:sushi_id/ingredients', to: 'ingredients#index' , as:'sushi_ingredients'

# get '/ingredients/new', to: 'ingredients#new'
# post '/ingredients', to: 'ingredients#create'

# get '/sushis/:sushi_id/ingredients/new', to: 'ingredients#new'
# post '/sushis/:sushi_id/ingredients', to: 'ingredients#create'

# get '/ingredients/:id', to: 'ingredients#show' , as: 'ingredient'
# get '/sushis/:sushi_id/ingredients/:id', to: 'ingredients#show', as:'sushi_ingredient'

get '/', to: "sushis#home", as: "home"
get '/:anything', to: "application#wrong_page"

end
