require 'caffeine/constraints/page_constraint'

module Caffeine
  Engine.routes.draw do
    root 'main_page#index'

    namespace :admin do
      root 'dashboard#index'

      resources :pages
    end

    # Define route for page tags
    get '*page_id/tags/:id', controller: 'pages/tags', action: :show

    # Define route for pages
    get '*page_id', to: 'pages#show', constraints: PageConstraint
  end
end
