class CreateTagsVodcastsJoin < ActiveRecord::Migration
  def self.up
    create_table 'tags_vodcasts', :id => false do |t|
      t.column 'vodcast_id', :integer
      t.column 'tag_id', :integer
     end
   end
 def self.down
   drop_table 'tags_vodcasts'
 end
end