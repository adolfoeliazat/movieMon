class MapController < ApplicationController
	def initialize
  		super
  		tiles = [
			"grass.png",
			"tall_grass.png",
			"ground.png"
		]

		if File.exist?("map.txt")
			@map = JSON.parse( File.read("map.txt")).map do |row|
				row.map do |i|
					tiles[i]
				end
			end
		else
			puts "Where is this fu**** map ?"
		end
  	end

  	def display
      	if $player
            @position = $player.position
            if params['move'] == 'up'
				if $player.direction == 'top'
                	@position['y'] -= 1 if @position['y'] > 0
				else
					$player.direction = 'top'
				end
            elsif params['move'] == 'down'
				if $player.direction == 'bottom'
                	@position['y'] += 1 if @position['y'] < 9
				else
					$player.direction = 'bottom'
				end
            elsif params['move'] == 'right'
				if $player.direction == 'right'
                    @position['x'] += 1 if @position['x'] < 9
				else
					$player.direction = 'right'
				end
            elsif params['move'] == 'left'
				if $player.direction == 'left'
                    @position['x'] -= 1 if @position['x'] > 0
				else
					$player.direction = 'left'
				end
            end

			if @map[@position['x']][@position['y']] == 'tall_grass.png' && !params['nobattle']
				get_battle
			end
        else
            redirect_to "/"
        end
  	end

  	def get_battle
	    battle = rand(6)
        if battle == 0
            start_battle
        else
            redirect_to "/map?nobattle=true"
        end
  	end

  	def start_battle
       	number = rand(9)
        redirect_to "/battles/battle/#{number}"
  	end

end