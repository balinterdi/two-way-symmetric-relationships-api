class Person < ActiveRecord::Base
  has_many :friended, through: :friender_friendships, class_name: Person
  has_many :friended_by, through: :friended_friendships, source: :friended, class_name: Person
  has_many :friender_friendships, class_name: Friendship, foreign_key: "friender_id"
  has_many :friended_friendships, class_name: Friendship, foreign_key: "friended_id"
end
