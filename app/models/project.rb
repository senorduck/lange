class Project < ActiveRecord::Base
  require "image_science"
  attr_accessible :status, :title, :description, :artwork, :x1, :y1, :width, :height
  attr_accessor :x1, :y1, :width, :height
  has_attached_file :artwork, :styles => {:thumb_on => { :geometry => "100%" },
                                          :thumb_off => { :geometry => "100%" }
                                         },
                              :convert_options => { :thumb_off => "-colorspace Gray" }

  before_create :set_active_status

  named_scope :active, :conditions => {:status => "active"}

  validates_presence_of :title, :description

  def crop(attr)
   x1 = attr[:x1].to_i
   y1 = attr[:y1].to_i
   x2 = x1 + attr[:width].to_i
   y2 = y1 + attr[:height].to_i
   ImageScience.with_image(self.artwork.path) do |img|
    img.with_crop(x1,y1,x2,y2) do |thumb|
      thumb.save self.artwork.path
    end
   end
   self.save

  end

  private

  def set_active_status
    self.status = "active"
  end
end
