class Accomplishment < ActiveRecord::Base
  validates_uniqueness_of :description
  default_scope :order => 'created_at DESC'
end
