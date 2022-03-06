Rails.application.routes.draw do
  namespace :site do
    get 'welcome/index'
  end
  namespace :students_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index'
  end
  devise_for :students
  devise_for :admins
  get 'inicio', to: "site/welcome#index"
  
  root "site/welcome#index"
end
