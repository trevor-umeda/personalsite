class Project < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "100x100>" }
  has_many :questions

end
