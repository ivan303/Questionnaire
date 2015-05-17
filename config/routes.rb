Rails.application.routes.draw do

  root  to: redirect('/questionnaires')

  resources :questionnaires, only: [:index, :show, :create, :update]
  resources :institutes, only: [:index, :show]
end
