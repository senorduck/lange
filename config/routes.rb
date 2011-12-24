ActionController::Routing::Routes.draw do |map|
  map.about '/about', :controller => 'pages', :action => 'about'

  map.resources :accomplishments, :users
  map.resources :projects,
    :member => {
      :crop => :get,
      :publish => :get,
      :activate => :get
    },
    :collection => {
      :deleted => :get
    }

  map.root :controller => "projects", :action => 'index', :conditions => {:method => :get}

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
