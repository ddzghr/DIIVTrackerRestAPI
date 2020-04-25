Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    scope module: 'v1' do
      scope '/api/v1' do
        scope '/free' do
          scope '/users' do
            post '/signup', to: 'users#create'
            post '/confirm-user', to: 'users#confirm'
            post '/reset', to: 'users#reset'
          end
          scope '/devices' do
            post '/confirm-device', to: 'devices#confirm'
            post '/unlock', to: 'devices#unlock'
          end
        end
        scope '/diiv' do
          scope '/system' do
            resources :address_types, path: '/address-types'
            resources :roles
            resources :device_types, path: '/device-types'
            resources :role_device_types, path: '/roles-device-types'
            resources :statuses
            resources :workflows
            resources :users
            #resources :users, param: :uuid do
            #  post 'login'
            #  post 'logout'
            #end
          end
          resources :clients, param: :uuid, only: [] do
            post 'login', to: 'authentication#authenticate'
            post 'logout', to: 'authentication#logout'
            resources :user_roles
            resources :devices, param: :uuid do
              resources :gps_locations, path: '/gps-locations'
            end
            resources :deliveries, param: :uuid do
              resources :delivery_statuses, path: '/delivery-statuses' do
                resources :gps_locations, path: '/gps-locations'
              end
            end
          end
        end
      end
    end
  end
end
