Rails.application.routes.draw do
  get '/' => 'uploads#index'
  post '/uploads' => 'uploads#create'
  get '/download/:id' => 'uploads#download'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
