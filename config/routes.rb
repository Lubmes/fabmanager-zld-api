Rails.application.routes.draw do

  get 'events_controller/index'

  get 'weekly_time_tables/show'

  get 'tags/index'

  get 'control_panel/show'

  namespace :api do
    namespace :v1 do
      resource :auth, only: %i[create]
      resources :tags, only: %i[index]
      resources :reservations, only: %i{index}

      resources :events do
        collection do
          post :retrieve_events
          get :calendars
        end
      end

      resources :users do
        resources :reservations, only: %i[create]
        member do
          get :occupations
          get :reservations
          get :comments
          get :tags
        end
        resources :fabmoments do
          member do
            get :tags
            get :likes
            get :programs
            get :materials
            get :machines
          end
          resources :comments
        end
      end
      resources :machines, :materials, :programs, :licenses
      resources :weekly_time_tables, only: [:show]
      get 'control_panel', to: 'control_panel#show'
      get 'fabmoments', to: 'fabmoments#app_index'
    end
  end

end
