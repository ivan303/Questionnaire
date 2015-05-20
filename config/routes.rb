Rails.application.routes.draw do

  root  to: redirect('/polls')

  get '/admin', to: redirect('/institutes')

  resources :polls, only: [:index, :show, :create, :update]
  resources :institutes
  resources :lecturers
  resources :questions, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :employments, only: [:destroy]
  resources :forms
  resources :votes

end
