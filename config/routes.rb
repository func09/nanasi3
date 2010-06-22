ActionController::Routing::Routes.draw do |map|
  map.resources :messages
  map.root :controller => 'messages', :action => 'index'
end
