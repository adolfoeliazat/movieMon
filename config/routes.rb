Rails.application.routes.draw do
  #root 
  root 'moviemon#title_screen'
  
  # moviemon controller

  get '/new_game', to:  'moviemon#new_game'
  get '/debug', to: 'moviemon#debug'
  get '/clear', to: 'moviemon#clear'

  #Show the slots available to save game
  get "save/(:current)", to: 'moviemon#selectsaveslot'
  get "save/slot/:id", to: 'moviemon#save'

  #Show the slots available to load game
  get "load/(:current)", to: "moviemon#selectloadslot"
  get "load/slot/:id", to: "moviemon#load"
  
  # map controller 

  get '/map', to: 'map#display'

  # battles
  get '/battles/battle/:id', to: 'battles#battle'
  get '/battles/runaway', to: 'battles#runaway'
  get '/battles/battle/:id/hit', to: 'battles#hit'
  get '/battles/win/:id', to: 'battles#win'
  get '/battles/loose', to: 'battles#loose'

  # moviedex
  get '/moviedex', to: redirect('/moviedex/0/map')
  get '/moviedex/:id', to: redirect('/moviedex/%{id}/map')
  get '/moviedex/:id/:from', to: 'moviedex#show'

  # => menu
  get '/menu', to: redirect('/menu/1/map')
  get '/menu/:id', to: redirect('/menu/%{id}/map')
  get '/menu/:id/:from', to: 'menu#show'


end
