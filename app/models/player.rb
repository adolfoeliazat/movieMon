class Player
	attr_accessor :name, :position, :hitpoint, :energy, :direction
	def initialize player = nil
		if (player == nil)
			@name = (0...8).map { (65 + rand(26)).chr }.join
			@hitpoint = 5
			@position = {
				'x' => 5,
				'y' => 9
			}
			@direction = "bottom"
      @energy = 50
		else
			@name = player["name"]
			@position = player["position"]
			@hitpoint = player["hitpoint"]
			@direction = player["direction"]
		end
	end
end