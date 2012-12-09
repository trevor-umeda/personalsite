class Question < ActiveRecord::Base
  scope :unanswered, where("answer IS null")
  belongs_to :project

end
