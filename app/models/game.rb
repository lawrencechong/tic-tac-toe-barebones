class Game < ApplicationRecord

	def checkWin
		# binding.pry
		# horizontal
		if (!self.a.nil? and self.a == self.b and self.b == self.c) or
			(!self.d.nil? and self.d == self.e and self.e == self.f) or
			(!self.g.nil? and self.g == self.h and self.h == self.i)
			return true 
		end

		# vertical
		if (!self.a.nil? and self.a == self.d and self.d == self.g) or
			(!self.b.nil? and self.b == self.e and self.e == self.h) or
			(!self.c.nil? and self.c == self.f and self.f == self.i)
			return true
		end

		# diagonal
		if (!self.a.nil? and self.a == self.e and self.e == self.i) or 
			(!self.c.nil? and self.c == self.e and self.e == self.g)
			return true
		end

		# no match
		false
	end

	def checkTie
		false
	end
end
