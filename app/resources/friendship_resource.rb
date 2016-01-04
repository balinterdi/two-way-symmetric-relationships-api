class FriendshipResource < JSONAPI::Resource
  belongs_to :first_friend
  belongs_to :second_friend
  attributes :strength
end
