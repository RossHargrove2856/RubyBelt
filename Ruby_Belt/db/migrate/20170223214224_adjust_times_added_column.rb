class AdjustTimesAddedColumn < ActiveRecord::Migration[5.0]
  def change
	  remove_column :songs, :times_added, :integer
	  add_column :playlists, :times_added, :integer
  end
end
