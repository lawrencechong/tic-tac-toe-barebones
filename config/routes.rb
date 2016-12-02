Rails.application.routes.draw do
  
	root to: 'home#index'
	get '/newGame' => 'games#new'
	get '/game/:id' => 'games#showGame'
	get 'makeMove/:gameID/:playerID/:position' => 'games#makeMove'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
