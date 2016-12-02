require 'pry'

class GamesController < ApplicationController

	def new
		@game = Game.new
		@game.currentPlayer = 1
		@game.save
		redirect_to "/game/#{@game.id}"
	end

	def showGame
		@game = Game.find(params["id"])
		@win = 1

		if !@game.checkWin
			@win = 0
			@user = 0
			# if session.nil?
			# binding.pry
				session = request.session_options[:id]
				if @game.player1.nil?
					@game.player1 = session
				elsif @game.player2.nil? and session != @game.player1
					@game.player2 = session
				end

				if session == @game.player1
					@user = 1
				elsif session == @game.player2
					@user = 2
				end
			# end
			@game.save

		end
		# binding.pry
	end

	def makeMove
		# binding.pry
		# check if valid move
		@game = Game.find(params["gameID"])
		if(@game[params["position"]].nil? && @game.currentPlayer == params["playerID"].to_i)
			@game[params["position"]] = 1 if params["playerID"] == "1"
			@game[params["position"]] = 2 if params["playerID"] == "2"
			if @game.currentPlayer == 1
				@game.currentPlayer = 2 
			else
				@game.currentPlayer = 1
			end
			# binding.pry
			if @game.checkWin
				@game.winner = @game.currentPlayer
			end

			@game.save
			# game.checkTie
		end
		redirect_to "/game/#{@game.id}"
	end

end