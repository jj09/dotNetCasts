class AddTitleToVodcasts < ActiveRecord::Migration
  def change
    add_column :vodcasts, :title, :string
  end
end
