require 'caffeine/constraints/page_constraint'

module Caffeine
  Engine.routes.draw do
    devise_for :admin_users, class_name: 'Caffeine::AdminUser', module: :devise

    root 'main_page#index'

    authenticate :admin_user do
      namespace :admin do
        root 'dashboard#index'

        get 'pages/search', to: 'pages#search'

        resources :pages
      end
    end

    # Define route for page tags
    get '*page_id/tags/:id', controller: 'pages/tags', action: :show, as: :page_tag

    # Define route for pages
    get '*page_id', to: 'pages#show', constraints: PageConstraint, as: :page
    end
end
