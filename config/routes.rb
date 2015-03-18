require 'caffeine/constraints/page_constraint'

module Caffeine
  Engine.routes.draw do
    root 'main_page#index'

    namespace :admin do
      root 'dashboard#index'

      resources :pages
    end

    resources :pages, only: :show, path: '/', constraints: PageConstraint do
      resources :tags, only: :show, module: :pages
    end
  end
end
