class Player
	attr_accessor :name, :position, :hitpoint, :energy, :direction
	def initialize player = nil
		if (player == nil)
			@names = ['Sacha', 'Ondine', 'Pierre', 'Prof Chen', 'Jessie', 'James']
			@name = @names[rand(5)]
			@hitpoint = 5
			@position = {
				'x' => 5,
				'y' => 9
			}
			@direction = "top"
      		@energy = 50
		else
			@name = player["name"]
			@position = player["position"]
			@hitpoint = player["hitpoint"]
			@direction = player["direction"]
		end
	end
end