Rails.application.routes.draw do

	get '/main' => 'users#main'

	post '/users/register'

	post '/users/login'

	delete '/users/logout'

	get '/songs/dashboard'

	post '/songs/create'

	post '/songs/add/:id' => 'songs#add'

	get '/songs/:id' => 'songs#show'

	get '/users/:id' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
