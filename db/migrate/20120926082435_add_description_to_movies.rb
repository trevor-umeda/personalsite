class AddDescriptionToMovies < ActiveRecord::Migration
  def self.up
        add_column :movies, :description, :text
      end

      def self.down
        remove_column :movies, :description, :text
      end
end
