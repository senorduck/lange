class Project < ActiveRecord::Base
  before_save :set_active_status
  named_scope :active, :conditions => {:status => "active"}
  has_attached_file :artwork, :styles => {:thumb_on => { :geometry => "125x168#" }, 
                                          :thumb_off => { :geometry => "125x168#"}
                                         },
                              :convert_options => { :thumb_off => "-colorspace Gray" }
  validates_presence_of :title, :description
  validates_attachment_presence :artwork
  
  private
  
  def set_active_status
    self.status = "active"
  end
end
