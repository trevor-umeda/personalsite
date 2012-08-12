class AddDescriptionToBlogs < ActiveRecord::Migration
  def self.up
      add_column :tags, :description, :text
    end

    def self.down
      remove_column :tagss, :title, :text
    end
end
