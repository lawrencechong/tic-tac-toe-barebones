require 'pry'

class GamesController < ApplicationController

	def new
		@game = Game.new
		@game.currentPlayer = 1
		@game.save
		redirect_to "/game/#{@game.id}"
	end

	def showGame
		@game = Game.find_by_id(params["id"])

		if @game.nil?
			redirect_to "/gamenotfound"
		else
			@session = request.session_options[:id]

			if !@game.checkWin
				@user = 0
				@session = request.session_options[:id]
				if @game.player1.nil?
					@game.player1 = @session
				elsif @game.player2.nil? and @session != @game.player1
					@game.player2 = @session
				end

				if @session == @game.player1
					@user = 1
				elsif @session == @game.player2
					@user = 2
				end
				@game.save

			end
		end
	end

	def makeMove
		# check if valid move
		@game = Game.find(params["gameID"])
		if(@game[params["position"]].nil? && @game.currentPlayer == params["playerID"].to_i)
			@game[params["position"]] = 1 if params["playerID"] == "1"
			@game[params["position"]] = 2 if params["playerID"] == "2"
			
			if @game.checkWin
				if @game.currentPlayer == 1
					@game.winner = @game.player1
				else
					@game.winner = @game.player2
				end
			end

			if @game.currentPlayer == 1
				@game.currentPlayer = 2 
			else
				@game.currentPlayer = 1
			end
			

			@game.save
			# game.checkTie
		end
		redirect_to "/game/#{@game.id}"
	end

	def search
		game = Game.find_by_id(params["search"])
		if game.nil?
			redirect_to "/gamenotfound"
		else
			redirect_to "/game/#{game.id}"
		end
	end

	def gamenotfound
	end
end