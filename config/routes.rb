Rails.application.routes.draw do
  root 'moviemon#title_screen'
  # moviemon controller
  get '/new_game', to:  'moviemon#new_game'
  get 'load', to: 'moviemon#load'

  # map controller 

  get '/map', to: 'map#display'

  get '/battles/battle/:id', to: 'battles#battle'
  get '/battles/runaway', to: 'battles#runaway'
  get '/battles/battle/:id/hit', to: 'battles#hit'
  get '/battles/win/:id', to: 'battles#win'
  get '/battles/loose', to: 'battles#loose'
  get '/clear', to: 'application#clear'

end
