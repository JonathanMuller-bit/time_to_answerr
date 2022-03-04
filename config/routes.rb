Rails.application.routes.draw do
  namespace :students_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :students
  devise_for :admins
  get 'inicio', to: "welcome#index"
  
  root "welcome#index"
end
