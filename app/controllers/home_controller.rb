class HomeController < ApplicationController
	def index
		@wins = 0
		@losses = 0
		@session = request.session_options[:id]
		Game.all.each{|game|
			if game["winner"] == @session
				@wins +=1
			elsif !game["winner"].nil? and (game["player1"] == @session or 
				game["player2"] == @session)
				@losses+=1
			end
		}
	end
end