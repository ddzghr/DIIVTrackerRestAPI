Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api' do
    scope module: 'v1' do
      scope '/api/v1' do
        scope '/diiv' do
          scope '/admin' do
            resources :probas
          end
          scope '/free' do
            resources :probas, only: [:index, :show]
          end
        end
      end
    end
  end
end
