Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    scope module: 'v1' do
      scope '/api/v1' do
        scope '/diiv' do
          scope '/system' do
            resources :address_types, :path => '/address-types'
            resources :roles
            resources :device_types, :path => '/device-types'
            resources :role_device_types, :path => '/roles-device-types'
            resources :statuses
            resources :workflows
          end
        end
      end
    end
  end
end
