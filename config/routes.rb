Rails.application.routes.draw do
  root 'moviemon#title_screen'
  # moviemon controller
  get '/new_game', to:  'moviemon#new_game'
  get 'load', to: 'moviemon#load'

  # map controller 

  get '/map', to: 'map#display'
end
