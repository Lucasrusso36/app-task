Rails.application.routes.draw do
  root "assignments#index"
  post "assignments/:id/toggle", to: "assignments#toggle"
  
  resources :assignments
end
