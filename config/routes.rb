Rails.application.routes.draw do
  root 'moviemon#title_screen'
  get '/new_game', to:  'moviemon#new_game'
  get 'load', to: 'moviemon#load'
end
