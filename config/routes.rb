Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resource :auth, only: %i[create]
      resources :users do
        resources :fabmoments
      end
    end
  end

end
