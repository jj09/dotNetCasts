FactoryGirl.define do
  factory :vodcast do
  	sequence(:title) { |n| "Vodcast ##{n}" }
  	sequence(:link) { |n| "http://www.youtube.com/watch?v=#{n}" }
  	desc "Lorem ipsum"
  end

  factory :user do
  	sequence(:name) { |n| "user#{n}"}
  	password "master"
  	password_confirmation "master"

  	factory :admin do
  		admin true
  	end
  end
end