class CreateVodcasts < ActiveRecord::Migration
  def change
    create_table :vodcasts do |t|
      t.string :link
      t.text :desc

      t.timestamps
    end
  end
end
