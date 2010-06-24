ActionController::Routing::Routes.draw do |map|
  map.resources :messages
  map.resources :secrets
  map.root :controller => 'messages', :action => 'index'
end
