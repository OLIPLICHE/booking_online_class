Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, defaults: { format: :json }, path: 'users',
                     path_names: { sign_in: 'login', sign_out: 'logout', registration: 'signup' }

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :courses, only: %i[index create destroy]
      resources :enrolments, only: %i[index create destroy]
    end
  end
end
