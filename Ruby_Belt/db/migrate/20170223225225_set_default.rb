class SetDefault < ActiveRecord::Migration[5.0]
  def change
	  change_column :songs, :times_added, :integer, :default => 0
	  change_column :playlists, :times_added, :integer, :default => 0
  end
end
