class Movie < ActiveRecord::Base
  has_many :reviews
  ajaxful_rateable :stars => 10,:allow_update => true

 def has_review user_id
   self.reviews.each do |review|
    if review.user_id == user_id
      return true
    end
   end
   return false
 end
end