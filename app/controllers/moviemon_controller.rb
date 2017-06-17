require 'open-uri'
require 'json'

class MoviemonController < ApplicationController

	def initialize
  		super
  	end

	def title_screen
		@start =  "/new_game"
		@select = "/load"
	end

  	def new_game
  		$player = Player.new
  		$game = Game.new
  		redirect_to "/map"
  	end

  	def selectsaveslot
  	end

  	def save
  	end

  	def selectloadslot
  	end

  	def load
  	end

  
end
