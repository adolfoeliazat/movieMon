module ApplicationHelper
	def up(url)
  		content_for :up, url.to_s
	end
	def down(url)
  		content_for :down, url.to_s
	end
	def left(url)
  		content_for :left, url.to_s
	end
	def right(url)
  		content_for :right, url.to_s
	end
	def a(url)
  		content_for :a, url.to_s
	end
	def b(url)
  		content_for :b, url.to_s
	end
	def select(url)
  		content_for :select, url.to_s
	end
	def start(url)
  		content_for :start, url.to_s
	end
end