Caffeine::Engine.routes.draw do
  root 'main_page#index'

  namespace :admin do
    root 'dashboard#index'
  end
end
