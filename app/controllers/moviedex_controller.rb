class MoviedexController < ApplicationController
	def initialize
		super
	end

	def show
		if $game and $player
			@from = params[:from] || 'map'
			@movieId = params[:id].to_i
			@moviemon = $game.movimons[params[:id].to_i]
			@moviemon["rating"] =  @moviemon["imdbRating"].to_f

			if @moviemon.nil?
				return
			end

			if @moviemon['status'] == 0
				@moviemon = {
					'status' => 0,
					'Title' => 'Unknown',
					'Poster' => 'unknown.jpg'
				}
			end

		else
			redirect_to "/"
		end
	end
end