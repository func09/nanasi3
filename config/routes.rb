ActionController::Routing::Routes.draw do |map|
  map.resources :statuses
  map.uid_status ':uid', :controller => 'statuses', :action => 'show', :requirements => { :uid => /[0-9a-zA-Z]{6}/ } 
  map.root :controller => 'statuses', :action => 'index'
end
