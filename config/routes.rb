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
resources :sushis, except: [:update]


get '/', to: "sushis#home", as: "home"
get '/:anything', to: "application#wrong_page"

end
