class PagesController < ApplicationController
  layout "application"
  
  def about
    @prefix = "about"
    @title = "About"
  end
  
end