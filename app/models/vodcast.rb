class Vodcast < ActiveRecord::Base
  attr_accessible :title, :desc, :link, :tags, :tag_ids

  before_save :convert_link

  has_and_belongs_to_many :tags 

  private
  	def convert_link
  		match_create = /.*youtube.com\/watch\?[feature=player_detailpage&]*v=(.*)/.match(self.link)
      match_update = /.*youtube.com\/embed\/(.+)?feature=player_detailpage/.match(self.link)
  		if match_create != nil
  			self.link = "http://www.youtube.com/embed/#{match[1]}?feature=player_detailpage"
      elsif match_update != nil
        # do not do anything with embed link
      else
        raise
  		end
  	end
end