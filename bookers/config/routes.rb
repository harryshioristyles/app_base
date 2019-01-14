Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#top'

  get '/books' => 'books#index'
  get '/book/:id' => 'books#show' , as: 'book'
  get '/book/:id/edit' => 'books#edit', as: 'edit_book'
  patch '/book/:id' => 'books#update', as: 'update_book'
  delete '/book/:id' => 'books#destroy', as: 'destroy_book'
  post '/books' => 'books#create'

end