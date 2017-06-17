class BattlesController < ApplicationController
	def initialize
  		super
  	end

  	def battle
		movieId = params[:id]
		if $player.nil? || $game.nil?
			redirect_to "/"
		elsif !(movieId.to_i < $game.movimons.length)
			redirect_to "/map"
		else
			$game.movimons[params[:id].to_i]['status'] = 1 if $game.movimons[params[:id].to_i]['status'] < 1
			$game.battle = Battle.new $game.movimons[params[:id].to_i]
		end
  	end

  	def runaway
  		movieId = params[:id]
  		$game.movimons[movieId.to_i]['status'] = 0 if $game.movimons[movieId.to_i]['status'] > 0
  		$game.battle = nil
  	end

	def hit
		if $player.nil? || $game.nil?
			redirect_to "/"
		else
			fail = (Random.rand(13) > $game.battle.movie["rating"])

			$game.battle.movie["energy"] -= $player.hitpoint
			if fail
				@message = "#{$game.battle.movie["Title"]} failed to attack"
			else
				$game.battle.playerenergy -= $game.battle.movie["rating"]
			end

			if $game.battle.movie["energy"] <= 0
				redirect_to ("/battles/win/" + $game.movimons.index($game.battle.movie).to_s)
			elsif $game.battle.playerenergy <= 0
				redirect_to ("/battles/loose")
			end
		end
	end

	def win
		puts params
		$game.battle.movie['status'] = 2
		$player.hitpoint += 0.2
		$player.energy = 50
	end

	def loose

	end

end