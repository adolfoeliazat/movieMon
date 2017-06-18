class Battle
	attr_accessor :movie, :playerenergy
	def initialize movie
		@movie = movie
		@playerenergy = 50
		@movie["energy"] = 50
		@movie["rating"] =  @movie["imdbRating"].to_i
	end
end