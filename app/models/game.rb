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
		if !self.checkWin
			arr = (a=*(0..8))
			arr.each{|index|
				return false if getSquare(index).nil?
			}
		end
		true
	end

	def computerMakeMove
		if self.winner.nil?
			index = self.findEmptyRandomSquareIndex
			self.updateSquare(index, 2)
			self.winner = self.player2 if self.checkWin
			self.currentPlayer = 1
			self.save
		end
	end

	def findEmptyRandomSquareIndex
		arr = (a=*(0..8)).shuffle
		index = -1
		arr.each{|index|
			if getSquare(index).nil?
				return index 
			end 
		}
		index
	end

	def getSquare(index)
		case index
			when 0 then self.a
			when 1 then self.b
			when 2 then self.c
			when 3 then self.d
			when 4 then self.e
			when 5 then self.f
			when 6 then self.g
			when 7 then self.h
			when 8 then self.i
		end	
	end

	def updateSquare(index, move)
		case index
			when 0 then self.a = move
			when 1 then self.b = move
			when 2 then self.c = move
			when 3 then self.d = move
			when 4 then self.e = move
			when 5 then self.f = move
			when 6 then self.g = move
			when 7 then self.h = move
			when 8 then self.i = move
		end
		self.save	
	end
end
