class AddImageUrlToProjects < ActiveRecord::Migration
    def self.up
    add_column :projects, :image_link_url, :string
  end

  def self.down
    remove_column :projects, :image_link_url, :string
  end
end
