# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def banner
    image_name = "bnr_#{@prefix}.jpg"
    image_tag(image_name, :width => 950, :height => 200, :alt => @title, :class => "banner")
  end
end
