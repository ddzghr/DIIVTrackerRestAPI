Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    scope module: 'v1' do
      scope '/api/v1' do
        scope '/diiv' do
          scope '/system' do
            resources :address_types, :path => '/address-types'
            resources :role_types, :path => '/role-types'
            resources :device_types, :path => '/device-types'
            resources :role_type_device_types, :path => '/role-types-device-types'
          end
        end
      end
    end
  end
end
