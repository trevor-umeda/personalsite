class AddTagToBlog < ActiveRecord::Migration
  def self.up
      add_column :blogs, :tag_id, :integer
    end

    def self.down
      remove_column :blogs, :tag_id
    end
end
