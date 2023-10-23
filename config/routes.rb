Rails.application.routes.draw do
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end
  
  resources :portifolios , except: [:delete,:show]
  
  get 'portifolio/show/:id', to: 'portifolios#show', as: 'portifolio_show'
  delete 'portifolio/:id', to: 'portifolios#destroy', as: 'portifolio_delete'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  

  root to: 'pages#home'
end
  