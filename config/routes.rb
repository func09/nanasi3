ActionController::Routing::Routes.draw do |map|
  map.about 'about', :controller => 'pages', :action => 'about'
  map.resource :mypage, :as => 'my'
  map.resources :statuses, :collection => { :timeline => :get }
  map.uuid_status ':uuid', :controller => 'statuses', :action => 'show', :requirements => { :uuid => /[0-9a-zA-Z]{6}/ } 
  map.root :controller => 'statuses', :action => 'index'
end
