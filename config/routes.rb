Rails.application.routes.draw do
  resources :consulta
  resources :medicos
  resources :pacientes
  
  root 'welcome#index'
end
