class FriendshipResource < JSONAPI::Resource
  has_one :friender
  has_one :friended
  attributes :strength
end
