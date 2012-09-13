class Blog < ActiveRecord::Base
  belongs_to :tag
  def self.paginated page
      self.paginate :page => (page || 1), :per_page => 5, :order => 'created_at'
    end
end
