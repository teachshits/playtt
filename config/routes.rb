Playtt::Application.routes.draw do
  
  ActiveAdmin.routes(self)

  devise_for :players
  
  resources :meetings do
    collection do
      post :enroll
      post :leave
      get :city
    end
  end
  
  resources :players
  resources :places
  resource :welcome, :only => :index

  root :to => 'welcome#index'
end
