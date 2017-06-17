class MoviemonController < ApplicationController

#http://www.omdbapi.com/?t=Game%20of%20Thrones&apikey=8f9f9766&
  def title_screen
    @start =  "/new_game"
	@select = "/load"
  end

  def new_game
  end

  def load
  end
  
end
