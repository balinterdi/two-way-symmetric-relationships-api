class Friendship < ActiveRecord::Base
  belongs_to :friender, class_name: Person
  belongs_to :friended, class_name: Person
end
