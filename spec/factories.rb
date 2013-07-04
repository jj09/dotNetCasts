FactoryGirl.define do
  factory :vodcast do
  	sequence(:title) { |n| "Vodcast ##{n}" }
  	sequence(:link) { |n| "http://www.youtube.com/watch?v=#{n}" }
  	desc "Lorem ipsum"
  end
end