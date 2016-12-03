Rails.application.routes.draw do
  
	root to: 'home#index'
	get '/newGame' => 'games#new'
	get '/game/:id' => 'games#showGame'
	get 'makeMove/:gameID/:playerID/:position' => 'games#makeMove'
	get '/search' => 'games#search'
	get 'gamenotfound' => 'games#gamenotfound'
end
