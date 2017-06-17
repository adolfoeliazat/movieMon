class MenuController < ApplicationController
	def show
		@from = params['from'] || 'map'
		@current = params['id'].to_i

		if @current < 1
			@current = 1
		elsif @current > 3
			@current = 3
		end

		@previous = @current - 1 || 3
		if @previous == 0
			@previous = 3
		end
		@next = @current + 1
		if @next == 4
			@next = 1
	  end
  	end
end