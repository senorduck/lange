ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.about '/about', :controller => 'pages', :action => 'about'
  
  map.resources :accomplishments
  map.resources :projects, :only => :index

  map.root :controller => "projects", :action => 'index', :conditions => {:method => :get}
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
