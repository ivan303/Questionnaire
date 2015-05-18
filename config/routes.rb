Rails.application.routes.draw do

  root  to: redirect('/questionnaires')

  resources :questionnaires, only: [:index, :show, :create, :update]
  resources :institutes
  resources :lecturers
  resources :questions, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :employments, only: [:destroy]

end
