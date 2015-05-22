Rails.application.routes.draw do

  root  to: redirect('/polls')

  get '/admin', to: redirect('/institutes')

  resources :polls, only: [:index, :show, :create, :update]
  resources :institutes, except: :show
  resources :lecturers
  resources :questions, except: :show
  resources :employments, only: [:destroy]
  resources :forms
  resources :votes

end
