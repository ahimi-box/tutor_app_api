Rails.application.routes.draw do
  devise_for :students
  devise_for :teachers

  namespace :api do
    namespace :v1 do
      resources :notices
      resources :messages, only:[:index, :show, :create]
      resources :rooms, only:[:show, :create]
      resources :academic_abilities, only:[:index, :create, :update, :destroy, :show]
      mount_devise_token_auth_for 'Student', at: 'student'
      mount_devise_token_auth_for 'Teacher', at: 'teacher'

      get 'teachers', to: "teachers#teacher_index"
      resources :teachers, only:[:update, :destroy, :show]
      resources :students, only:[:index, :update, :destroy]
      resources :inquiries, only:[:index, :create, :update]
    end
  end
end