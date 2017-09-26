Rails.application.routes.draw do

  get 'tags/index'

  get 'control_panel/show'

  namespace :api do
    namespace :v1 do
      resource :auth, only: %i[create]
      resources :tags, only: %i[index]
      resources :users do
        member do
          get :occupations
          get :reservations
          get :comments
          get :tags
        end
        resources :fabmoments do
          member do
            get :tags
          end
          resources :comments
        end
      end
      resources :machines, :materials, :programs, :licenses
      get 'control_panel', to: 'control_panel#show'
    end
  end

end
