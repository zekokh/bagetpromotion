Rails.application.routes.draw do

  get 'promocod', to: 'promocod#index'
  get 'search', to: 'promocod#searche'
  #get 'generate', to: 'promocod#grate'
  get 'all', to: 'promocod#all'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
