Rails.application.routes.draw do
  root 'homes#top'
  
  resource :user, only: [:new, :create, :show]
end
