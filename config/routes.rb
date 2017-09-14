Rails.application.routes.draw do

  get 'control_panel/show'

  namespace :api do
    namespace :v1 do
      resource :auth, only: %i[create]
      resources :users do
        resources :fabmoments do
          resources :comments
        end
      end
      resources :machines, :materials, :programs, :licenses
      get 'control_panel', to: 'control_panel#show'
    end
  end

end
