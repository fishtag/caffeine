require 'caffeine/constraints/page_constraint'

module Caffeine
  Engine.routes.draw do
    root 'main_page#index'

    namespace :admin do
      root 'dashboard#index'
    end

    get '/*page_path', to: 'pages#show', as: :page, constraints: PageConstraint
  end
end
