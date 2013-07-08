class Comment < ActiveRecord::Base
  attr_accessible :content, :vodcast_id, :user_id

  belongs_to :user
  belongs_to :vodcast
end
