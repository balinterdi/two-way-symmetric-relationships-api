class Person < ActiveRecord::Base
  has_many :friended, through: :friender_friendships, class_name: Person
  has_many :friended_by, through: :friended_friendships, source: :friended, class_name: Person
  has_many :friender_friendships, class_name: Friendship, foreign_key: "friender_id"
  has_many :friended_friendships, class_name: Friendship, foreign_key: "friended_id"
  #FIXME: the foreign key constraint is always added, WHERE friendship.person_id = 1 AND <whatever you write in the scope>
  # has_many :friendships, ->(person) { conditions("friender_id = ? OR friended_id = ?", person.id, person.id) }

  #NOTE: This needs to be a true relationship, so the below will not work
  def friendships
    Friendship.where("friender_id = ? OR friended_id = ?", id, id);
  end

  # def friends
  #   (friended + friended_by).uniq
  # end
end
