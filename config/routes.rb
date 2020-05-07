Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # This is scope which does not need authentication
  # so it is open for usage
  scope module: 'api/v1', path: 'api/v1/free', as: 'free' do
    resources :deliveries, param: :uuid, only: [:show]
    resource :user, path: 'signup', only: [:create]
    resources :users, param: :uuid, only: [] do
      get 'reset-my-credentials', on: :member, to: 'reset_my_credentials'
      get 'reset', param: :token, on: :member
      get 'confirm', param: :token, on: :member
    end
    resources :devices, param: :uuid, only: [] do
      get 'reset-my-credentials', on: :member, to: 'reset_my_credentials'
      get 'reset', param: :token, on: :member
      get 'confirm', param: :token, on: :member
    end
  end

  # This scope is for DIIVTracker WEB application
  # client's (users) are connected trough it
  scope module: 'api/v1', path: 'api/v1/', as: 'clients' do
    resources :clients, param: :uuid, only: [] do
      post 'login', to: 'user_authentication#authenticate'
      post 'logout', to: 'user_authentication#logout'
      resources :user_roles, path: 'my-roles'
      resources :devices, param: :uuid, path: 'my-devices' do
        resources :gps_locations, path: 'gps-locations'
      end
      resources :deliveries, param: :uuid do
        resources :delivery_statuses, path: 'delivery-statuses' do
          resources :gps_locations, path: 'gps-locations'
        end
      end
      # This is Admin part
      resources :address_types, path: '/address-types'
      resources :roles
      resources :device_types, path: '/device-types'
      resources :role_device_types, path: '/roles-device-types'
      resources :statuses
      resources :workflows
      resources :users, param: :uuid do
        resources :user_roles, path: '/user-roles'
      end
      resources :devices, param: :uuid do
        resources :gps_locations, path: '/gps-locations'
      end
      # end of Admin part
    end
  end

  # This scope is for apps running on devices
  # DIIVTracker WEB application is an app on device
  scope module: 'api/v1', path: 'api/v1/', as: 'apps' do
    resources :devices, param: :uuid, only: [], path: 'apps' do
      post 'login', to: 'device_authentication#authenticate'
      post 'logout', to: 'device_authentication#logout'
      resources :deliveries, param: :uuid do
        resources :delivery_statuses, path: 'delivery-statuses' do
          resources :gps_locations, path: 'gps-locations'
        end
      end
      # this is part for DIIVTracker WEB application
      resources :address_types, only: [:index, :show], path: 'address-types'
      resources :roles, only: [:index, :show]
      resources :device_types, only: [:index, :show], path: 'device-types'
      resources :role_device_types, only: [:index, :show], path: 'roles-device-types'
      resources :statuses, only: [:index, :show]
      resources :workflows, only: [:index, :show]
      resources :users, param: :uuid, only: [:index, :show] do
        resources :user_roles, path: '/user-roles', only: [:index, :show]
      end
      # end of part for DIIVTracker WEB application
    end
  end
end
