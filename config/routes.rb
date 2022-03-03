Rails.application.routes.draw do
  devise_for :students
  devise_for :admins
  get 'inicio', to: "welcome#index"
  
  root "welcome#index"
end
