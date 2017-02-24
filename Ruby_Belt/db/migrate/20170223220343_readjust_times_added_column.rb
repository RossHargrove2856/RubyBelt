class ReadjustTimesAddedColumn < ActiveRecord::Migration[5.0]
  def change
	  add_column :songs, :times_added, :integer
  end
end
