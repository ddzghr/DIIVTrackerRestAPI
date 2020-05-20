Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# This is scope which does not need authentication
# so it is open for usage
  root to: 'hellos#index'
  scope module: 'api/v1', path: 'api/v1/free', as: 'free' do
    resources :deliveries, param: :uuid, only: [:show]
    resource :user, path: 'signup', only: [:create]
    resources :users, param: :uuid, only: [] do
      get 'reset-my-credentials', on: :member, to: 'reset_my_credentials'
      get 'reset', param: :user_token, on: :member
      get 'confirm', param: :user_token, on: :member
    end
    resources :devices, param: :uuid, only: [] do
      get 'confirm', param: :device_token, on: :member
    end
  end

  # This scope is for DIIVTracker WEB application
  # client's (users) are connected trough it
  scope module: 'api/v1', path: 'api/v1/', as: 'clients' do
    resources :clients, param: :uuid, only: [] do
      post 'login', to: 'user_authentication#authenticate'
      post 'logout', to: 'user_authentication#logout'
      resources :user_roles, param: :uuid, path: 'user-roles'
      resources :devices, param: :uuid, path: 'devices' do
        get 'reset', on: :member
        resources :gps_locations, path: 'gps-locations', only: [:index, :create]
      end
      resources :deliveries, param: :uuid, path: 'deliveries' do
        resources :delivery_statuses, path: 'delivery-statuses', only: [:index, :create] do
          resources :gps_locations, path: 'gps-locations', only: [:index, :create]
        end
      end
      resources :delivery_statuses, path: 'delivery-statuses', except: [:index, :create] do
        resources :gps_locations, path: 'gps-locations', only: [:index, :create]
      end
      resources :gps_locations, path: 'gps-locations', except: [:index, :create]

      # This is Admin part
      resources :address_types, path: '/address-types'
      resources :roles
      resources :device_types, path: '/device-types'
      resources :role_device_types, path: '/roles-device-types'
      resources :statuses
      resources :workflows
      resources :users, param: :uuid do
        resources :user_roles, path: '/user-roles', only: [:index, :create]
        resources :devices, param: :uuid, only: [:index, :create] do
          get 'reset', on: :member
          resources :gps_locations, path: '/gps-locations', only: [:index, :create]
        end
        resources :deliveries, param: :uuid, path: 'deliveries', only: [:index, :create] do
          resources :delivery_statuses, path: 'delivery-statuses', only: [:index, :create] do
            resources :gps_locations, path: 'gps-locations', only: [:index, :create]
          end
        end
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
        resources :user_roles, param: :uuid, path: '/user-roles', only: [:index, :show]
      end
      # end of part for DIIVTracker WEB application
    end
  end
end
