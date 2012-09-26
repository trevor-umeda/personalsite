class Movie < ActiveRecord::Base
  ajaxful_rateable :stars => 10,:allow_update => true


end