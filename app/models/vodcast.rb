class Vodcast < ActiveRecord::Base
  attr_accessible :title, :desc, :link, :tags, :tag_ids

  before_save :convert_link

  has_and_belongs_to_many :tags

  private
  	def convert_link
  		match = /.*youtube.com\/watch\?[feature=player_detailpage&]*v=(.*)/.match(self.link)
  		if match != nil
  			self.link = "http://www.youtube.com/embed/#{match[1]}?feature=player_detailpage"
  		else
  			raise
  		end
  	end
end