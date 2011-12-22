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
   coords = {:x1 => x1, :y1 => y1, :x2 => x2, :y2 => y2}
   thumbify self.artwork.path(:thumb_on), coords
   thumbify self.artwork.path(:thumb_off), coords
   self.save

  end

  private

  def thumbify(image, coords)
    ImageScience.with_image(image) do |img|
      img.with_crop(coords[:x1],coords[:y1],coords[:x2],coords[:y2]) do |cropped_img|
        cropped_img.resize(125,168) do |final_image|
          final_image.save image
        end
      end
    end
  end

  def set_active_status
    self.status = "active"
  end
end
