BbLivePoll::Application.routes.draw do
  resources :kitties
  root :to => 'kitties#index'
end
