class Game
	attr_accessor :movimons, :battle
	def initialize movimons = nil
    @battle = nil
		if movimons.nil?
			@movimons = []
			@movies_ids = [
							'tt1285016', 
							'tt1739212', 
							'tt0096895', 
							'tt0068646', 
							'tt0109830',
							'tt1098327',
							'tt0286716',
							'tt0804540',
							'tt0462538',
							'tt1201607'
						]

			@movies_ids.each do |id|
				begin
					m = JSON.load(open("http://www.omdbapi.com/?i=#{id}&type=movie&page=2&apikey=8f9f9766&"))
				rescue
				end
				m['status'] = 0
				@movimons.push(m)
			end
		else
			@movimons = movimons
		end
	end
end